import { NextRequest, NextResponse } from 'next/server'
import {
  getProductColor,
  isSizeAvailable,
  productRequiresColor,
  productRequiresSize,
  toMocProduct,
} from '@/lib/products'
import { getShippingLocation } from '@/lib/shipping-locations'
import { supabase } from '@/lib/supabase'
import { allowsMultipleOrders } from '@/lib/test-email'

function supabaseMessage(error: unknown): string {
  if (error && typeof error === 'object' && 'message' in error && typeof error.message === 'string') {
    return error.message
  }
  if (error instanceof Error) return error.message
  return 'Failed to create order'
}

// Sequential order numbers: RAMOC-001, RAMOC-002, ...
async function generateOrderNumber(): Promise<string> {
  const { data: orders, error } = await supabase
    .from('ra_moc_orders')
    .select('order_number')
    .order('created_at', { ascending: false })
    .limit(1)

  if (error) {
    console.error('Error fetching last order number:', error)
    throw error
  }

  if (!orders || orders.length === 0) {
    return 'RAMOC-001'
  }

  const match = orders[0].order_number.match(/RAMOC-(\d+)/i)
  if (match) {
    const nextNumber = parseInt(match[1], 10) + 1
    return `RAMOC-${String(nextNumber).padStart(3, '0')}`
  }

  return 'RAMOC-001'
}

export async function POST(request: NextRequest) {
  try {
    if (!process.env.NEXT_PUBLIC_SUPABASE_URL || !process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY) {
      return NextResponse.json(
        {
          error:
            'Supabase is not configured. Add NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY, then redeploy.',
        },
        { status: 500 }
      )
    }

    const body = await request.json()
    const { email, firstName, lastName, locationId, productId, sku, color, size, logo } = body

    if (!email || !firstName || !lastName || !productId || !sku || !logo || !locationId) {
      return NextResponse.json({ error: 'Missing required fields' }, { status: 400 })
    }

    if (logo !== 'MOC') {
      return NextResponse.json({ error: 'Invalid logo brand' }, { status: 400 })
    }

    const location = getShippingLocation(String(locationId))
    if (!location) {
      return NextResponse.json({ error: 'Invalid shipping location' }, { status: 400 })
    }

    const { data: productRow, error: productError } = await supabase
      .from('ra_moc_products')
      .select('*')
      .eq('id', productId)
      .eq('active', true)
      .maybeSingle()

    if (productError) throw productError
    if (!productRow) {
      return NextResponse.json({ error: 'Invalid product selection' }, { status: 400 })
    }

    const product = toMocProduct(productRow as Record<string, unknown>)
    const colorMatch =
      typeof color === 'string' ? getProductColor(product, color) : undefined

    if (sku !== product.sku) {
      return NextResponse.json({ error: 'Invalid product SKU' }, { status: 400 })
    }

    if (productRequiresColor(product) && !colorMatch) {
      return NextResponse.json({ error: 'Invalid color selection' }, { status: 400 })
    }

    if (productRequiresSize(product)) {
      if (typeof size !== 'string' || !colorMatch || !isSizeAvailable(colorMatch, size)) {
        return NextResponse.json({ error: 'Invalid or unavailable size' }, { status: 400 })
      }
    }

    const normalizedEmail = String(email).toLowerCase().trim()

    // Test login can reorder. maybeSingle() would error once that email has more than one row.
    if (!allowsMultipleOrders(normalizedEmail)) {
      const { data: existingOrder, error: existingError } = await supabase
        .from('ra_moc_orders')
        .select('order_number')
        .eq('email', normalizedEmail)
        .maybeSingle()

      if (existingError) throw existingError
      if (existingOrder) {
        return NextResponse.json(
          { error: 'This email has already been used to place an order. Only one order is allowed per email.' },
          { status: 409 }
        )
      }
    }

    const orderNumber = await generateOrderNumber()

    const { data: order, error: orderError } = await supabase
      .from('ra_moc_orders')
      .insert({
        order_number: orderNumber,
        email: normalizedEmail,
        first_name: String(firstName).trim(),
        last_name: String(lastName).trim(),
        product_id: product.id,
        product_name: product.name,
        item_number: product.item_number,
        sku,
        color: productRequiresColor(product) ? String(color) : null,
        size: productRequiresSize(product) ? String(size) : null,
        logo,
        shipping_location_id: location.id,
        shipping_name: `${String(firstName).trim()} ${String(lastName).trim()}`,
        shipping_attention: location.attention,
        shipping_address: location.address,
        shipping_address2: location.address2 || null,
        shipping_city: location.city,
        shipping_state: location.state,
        shipping_zip: location.zip,
        shipping_country: location.country,
      })
      .select()
      .single()

    if (orderError) {
      const duplicate =
        orderError.message?.includes('duplicate key') ||
        orderError.message?.includes('idx_ra_moc_orders_one_per_email')
      if (duplicate) {
        return NextResponse.json(
          { error: 'This email has already been used to place an order. Only one order is allowed per email.' },
          { status: 409 }
        )
      }
      throw orderError
    }

    return NextResponse.json({
      success: true,
      order_number: orderNumber,
      order_id: order.id,
    })
  } catch (error: unknown) {
    console.error('Order creation error:', error)
    const message = supabaseMessage(error)
    if (message.includes('ra_moc_orders') && message.includes('does not exist')) {
      return NextResponse.json(
        { error: 'Orders table is missing. Run migrations/01-ra-moc-schema.sql in the Supabase SQL editor.' },
        { status: 500 }
      )
    }
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
