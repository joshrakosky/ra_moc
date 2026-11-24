// Fixed ship-to for MOC gifts — single RepHQ destination.

export interface ShippingLocation {
  id: string
  label: string
  /** Printed above Attn on the review/shipping card. */
  company: string
  /** Printed on the label as Attn: … */
  attention: string
  address: string
  address2: string
  city: string
  state: string
  zip: string
  country: string
}

export const SHIPPING_LOCATIONS: ShippingLocation[] = [
  {
    id: 'rephq',
    label: 'RepHQ',
    company: 'Republic Airways HQ',
    attention: 'Program Manager',
    address: '2 Brickyard Lane',
    address2: '',
    city: 'Carmel',
    state: 'IN',
    zip: '46032',
    country: 'USA',
  },
]

/** Convenience accessor — MOC only has one ship-to. */
export const REPHQ = SHIPPING_LOCATIONS[0]

export function getShippingLocation(id: string): ShippingLocation | undefined {
  return SHIPPING_LOCATIONS.find((location) => location.id === id)
}
