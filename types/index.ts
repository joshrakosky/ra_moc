// Types for Republic Airways MOC (Maintenance Operation Control) gift store.

/** Fixed cobranded logo for this program (no brand picker). */
export type LogoBrand = 'MOC'

/** Soft inventory from the catalog sheet: + → available, NONE → unavailable. */
export type SizeAvailability = 'available' | 'unavailable'

/** One color variant with per-size stock flags. */
export interface ProductColor {
  name: string
  /** Fallback image path when catalogImagePath is unavailable. */
  image_url?: string
  /** Size key present only when the style offers that size for this color. */
  sizes: Record<string, SizeAvailability>
}

/** One product chosen on the products page (sessionStorage). */
export interface ProductSelection {
  id: string
  name: string
  sku: string
  itemNumber: string
  imageUrl: string
  logo: LogoBrand
  size?: string
  color?: string
}

/** Shipping step: recipient + locked RepHQ ship-to (no free-form address). */
export interface ShippingInfo {
  firstName: string
  lastName: string
  email: string
  locationId: string
  locationLabel: string
  company: string
  attention: string
  address: string
  address2: string
  city: string
  state: string
  zip: string
  country: string
}

/** Row in ra_moc_orders — one product per order, no pricing. */
export interface Order {
  id: string
  order_number: string
  email: string
  first_name: string
  last_name: string
  product_id?: string | null
  product_name: string
  item_number: string
  sku: string
  color?: string | null
  size?: string | null
  logo: LogoBrand
  shipping_location_id: string
  shipping_name: string
  shipping_attention?: string | null
  shipping_address: string
  shipping_address2?: string | null
  shipping_city: string
  shipping_state: string
  shipping_zip: string
  shipping_country: string
  created_at: string
}
