// MOC catalog helpers. Products live in ra_moc_products (no pricing).
// Color/size availability comes from RA-MOC-PRODUCTS-V2.xlsx.

import { catalogImagePath } from '@/lib/catalog-images'
import { supabase } from '@/lib/supabase'
import type { ProductColor, SizeAvailability } from '@/types'

export interface MocProduct {
  id: string
  name: string
  description: string | null
  sku: string
  item_number: string
  image_url: string | null
  available_sizes: string[] | null
  colors: ProductColor[] | null
  /** External spec sheet. Empty when this style has no size chart. */
  size_chart_url: string | null
  sort_order: number
  active: boolean
}

function parseSizeMap(value: unknown): Record<string, SizeAvailability> {
  if (!value || typeof value !== 'object' || Array.isArray(value)) return {}
  const sizes: Record<string, SizeAvailability> = {}
  for (const [size, status] of Object.entries(value as Record<string, unknown>)) {
    if (status === 'available' || status === 'unavailable') {
      sizes[size] = status
    }
  }
  return sizes
}

function parseColors(value: unknown): ProductColor[] | null {
  if (!Array.isArray(value) || value.length === 0) return null
  const colors: ProductColor[] = []
  for (const entry of value) {
    if (!entry || typeof entry !== 'object' || !('name' in entry) || typeof entry.name !== 'string') {
      continue
    }
    colors.push({
      name: entry.name,
      image_url:
        'image_url' in entry && typeof entry.image_url === 'string' ? entry.image_url : undefined,
      sizes: parseSizeMap('sizes' in entry ? entry.sizes : {}),
    })
  }
  return colors.length > 0 ? colors : null
}

export function toMocProduct(row: Record<string, unknown>): MocProduct {
  return {
    id: String(row.id),
    name: String(row.name),
    description: typeof row.description === 'string' ? row.description : null,
    sku: String(row.sku),
    item_number: String(row.item_number ?? row.sku),
    image_url: typeof row.image_url === 'string' ? row.image_url : null,
    available_sizes: Array.isArray(row.available_sizes)
      ? row.available_sizes.filter((size): size is string => typeof size === 'string')
      : null,
    colors: parseColors(row.colors),
    size_chart_url: sizeChartHref(row.size_chart_url),
    sort_order: Number(row.sort_order ?? 0),
    active: Boolean(row.active),
  }
}

/** Only http(s) spec-sheet links are opened from the product popup. */
export function sizeChartHref(value: unknown): string | null {
  if (typeof value !== 'string' || !value.trim()) return null
  try {
    const url = new URL(value.trim())
    if (url.protocol !== 'https:' && url.protocol !== 'http:') return null
    return url.toString()
  } catch {
    return null
  }
}

export function productColors(product: MocProduct): ProductColor[] {
  return product.colors ?? []
}

export function productRequiresColor(product: MocProduct): boolean {
  return productColors(product).length > 0
}

/** True when any offered color has at least one size key (apparel / sized goods). */
export function productRequiresSize(product: MocProduct): boolean {
  return productColors(product).some((color) => Object.keys(color.sizes).length > 0)
}

export function getProductColor(product: MocProduct, colorName: string): ProductColor | undefined {
  return productColors(product).find((color) => color.name === colorName)
}

/** Size is orderable only when status is available for that color. */
export function isSizeAvailable(color: ProductColor | undefined, size: string): boolean {
  return color?.sizes[size] === 'available'
}

/** Sizes shown in the picker for a color (available + unavailable greyed). */
export function sizesForColor(color: ProductColor | undefined): string[] {
  if (!color) return []
  const order = ['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL', 'OS']
  const keys = Object.keys(color.sizes)
  return order.filter((size) => keys.includes(size)).concat(keys.filter((k) => !order.includes(k)))
}

/**
 * Colors with a single size (usually OS) should not ask the shopper to pick.
 * The size is still stored on the order and export.
 */
export function soleSizeForColor(color: ProductColor | undefined): string | undefined {
  const sizes = sizesForColor(color)
  return sizes.length === 1 ? sizes[0] : undefined
}

/** Cobranded MOC thumbnail from public/images, then the catalog fallback. */
export function previewImage(product: MocProduct, colorName?: string): string {
  const color =
    (colorName ? product.colors?.find((entry) => entry.name === colorName) : undefined) ??
    product.colors?.[0]

  if (color) {
    return catalogImagePath(product.item_number, color.name)
  }

  return product.image_url || '/images/placeholder-product.svg'
}

export const PRODUCT_STYLES = ["Men's", "Women's"] as const
export type ProductStyle = (typeof PRODUCT_STYLES)[number]

export function getProductStyle(product: MocProduct): ProductStyle {
  const name = product.name.toLowerCase()
  if (/\bwom[ae]n['’]?s?\b/.test(name)) return "Women's"
  return "Men's"
}

/** A–Z by product name for the products grid. */
export function sortCatalogForGrid(products: MocProduct[]): MocProduct[] {
  return [...products].sort((a, b) => a.name.localeCompare(b.name, undefined, { sensitivity: 'base' }))
}

export async function fetchActiveProducts(): Promise<MocProduct[]> {
  const { data, error } = await supabase
    .from('ra_moc_products')
    .select('*')
    .eq('active', true)
    .order('sort_order', { ascending: true })

  if (error) throw error
  return sortCatalogForGrid((data ?? []).map((row) => toMocProduct(row as Record<string, unknown>)))
}
