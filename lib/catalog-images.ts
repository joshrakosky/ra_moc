// MOC thumbnails on disk: /images/RA.MOC_{SKU}_{COLOR.TOKEN}.jpg
// Spreadsheet color names map to filename tokens via aliases below.

/** Spreadsheet color → token used in the filename. */
const COLOR_TOKEN: Record<string, string> = {
  // Eddie Bauer files use BLACK for spreadsheet "Deep Black".
  'Deep Black': 'BLACK',
  // WeatherEdge files keep the hyphen (not a dot).
  'Cobalt-Navy': 'COBALT-NAVY',
  'Metal-Steel': 'METAL-STEEL',
  // Leading "Heather" must stay HEATHER (not HTHR).
  'Heather Grey': 'HEATHER.GREY',
  'Black Heather': 'BLACK.HTHR',
  'Royal Heather': 'ROYAL.HTHR',
  'Cool Grey Heather': 'COOL.GREY.HTHR',
  'Navy Heather': 'NAVY.HTHR',
  'Carbon Heather': 'CARBON.HTHR',
  'TNF Dark Grey Heather': 'TNF.DARK.GREY.HTHR',
  'Urban Navy Heather': 'URBAN.NAVY.HTHR',
  'TNF Black': 'TNF.BLACK',
  'Pitch Black': 'PITCH.BLACK',
  'Indigo Navy': 'INDIGO.NAVY',
  'Deep Lake': 'DEEP.LAKE',
  'Dockside Blue': 'DOCKSIDE.BLUE',
  'Ultimate Grey': 'ULTIMATE.GREY',
  'Light Sky Blue': 'LIGHT.SKY.BLUE',
  'River Blue Navy': 'RIVER.BLUE.NAVY',
  'Iron Gate': 'IRON.GATE',
  'Quiet Shade Grey': 'QUIET.SHADE.GREY',
}

/**
 * SKU + color overrides when the photo name diverges from the sheet
 * (women's TravisMathew Quiet Shade ships as MICROCHIP.GREY).
 */
const SKU_COLOR_TOKEN: Record<string, string> = {
  'TM1LD002::Quiet Shade Grey': 'MICROCHIP.GREY',
}

function colorToken(itemNumber: string, colorName: string): string {
  const skuKey = `${itemNumber}::${colorName}`
  if (SKU_COLOR_TOKEN[skuKey]) return SKU_COLOR_TOKEN[skuKey]
  if (COLOR_TOKEN[colorName]) return COLOR_TOKEN[colorName]

  // Trailing "Heather" → HTHR; otherwise non-alnum → dots.
  let text = colorName.trim()
  if (/\bHeather$/i.test(text)) {
    text = text.replace(/\s*Heather$/i, ' HTHR')
  }
  return text
    .toUpperCase()
    .replace(/[^A-Z0-9\-]+/g, '.')
    .replace(/\.+/g, '.')
    .replace(/^\.|\.$/g, '')
}

/** Public URL for a MOC cobranded color photo. */
export function catalogImagePath(itemNumber: string, colorName: string): string {
  return `/images/RA.MOC_${itemNumber}_${colorToken(itemNumber, colorName)}.jpg`
}
