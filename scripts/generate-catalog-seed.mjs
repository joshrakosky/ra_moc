/**
 * Reads RA-MOC-PRODUCTS-V2.xlsx and writes
 * migrations/02-ra-moc-seed-products.sql
 *
 * Sheet cells:
 *   +     → available
 *   NONE  → unavailable (greyed in UI)
 *   -     → size not offered for that color (omit)
 *
 * No logo columns — every color is Republic x MOC cobranded.
 */
import fs from 'node:fs'
import path from 'node:path'
import { createRequire } from 'node:module'
import { fileURLToPath } from 'node:url'

// xlsx is CJS — use createRequire so readFile works under ESM.
const require = createRequire(import.meta.url)
const XLSX = require('xlsx')

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.join(__dirname, '..')

const DEFAULT_XLSX = path.join(
  process.env.USERPROFILE || process.env.HOME || '',
  'Downloads',
  'RA-MOC-PRODUCTS-V2.xlsx'
)
const xlsxPath = process.argv[2] || DEFAULT_XLSX
const outPath = path.join(root, 'migrations', '02-ra-moc-seed-products.sql')

// sheet_to_json drops leading empty column A, so index 0 = Excel column B.
const SIZE_COLS = [
  { col: 3, size: 'XS' },
  { col: 4, size: 'S' },
  { col: 5, size: 'M' },
  { col: 6, size: 'L' },
  { col: 7, size: 'XL' },
  { col: 8, size: '2XL' },
  { col: 9, size: '3XL' },
  { col: 10, size: '4XL' },
]
const COL_NAME = 0
const COL_ITEM = 1
const COL_COLOR = 2
// Excel column M, after sheet_to_json drops the empty column A.
const COL_SIZE_CHART = 11

function sqlString(value) {
  return `'${String(value).replace(/'/g, "''")}'`
}

function colorSlug(name) {
  return String(name).replace(/[^a-zA-Z0-9]+/g, '')
}

function parseSizeCell(raw) {
  if (raw == null) return null
  const text = String(raw).trim().toUpperCase()
  if (text === '+') return 'available'
  if (text === 'NONE') return 'unavailable'
  if (text === '-' || text === '') return null
  return null
}

if (!fs.existsSync(xlsxPath)) {
  console.error(`Spreadsheet not found: ${xlsxPath}`)
  process.exit(1)
}

const workbook = XLSX.readFile(xlsxPath)
const sheet = workbook.Sheets[workbook.SheetNames[0]]
const rows = XLSX.utils.sheet_to_json(sheet, { header: 1, defval: null })

/** @type {Map<string, { name: string, itemNumber: string, colors: object[], sizeSet: Set<string>, sortOrder: number, sizeChartUrl: string|null }>} */
const products = new Map()
let current = null
let sortOrder = 0

// Rows 0–1 are headers; product data starts at index 2.
for (let i = 2; i < rows.length; i++) {
  const row = rows[i]
  if (!row || !Array.isArray(row)) continue

  const itemName = row[COL_NAME] != null && String(row[COL_NAME]).trim() ? String(row[COL_NAME]).trim() : null
  const itemNumber = row[COL_ITEM] != null && String(row[COL_ITEM]).trim() ? String(row[COL_ITEM]).trim() : null
  const colorName = row[COL_COLOR] != null && String(row[COL_COLOR]).trim() ? String(row[COL_COLOR]).trim() : null

  if (itemName && itemNumber) {
    sortOrder += 1
    const chartCell = row[COL_SIZE_CHART] != null ? String(row[COL_SIZE_CHART]).trim() : ''
    current = {
      name: itemName,
      itemNumber,
      colors: [],
      sizeSet: new Set(),
      sortOrder,
      // Spec sheet lives on the product row, not each color.
      sizeChartUrl: /^https?:\/\//i.test(chartCell) ? chartCell : null,
    }
    products.set(itemNumber, current)
  }

  if (!current || !colorName) continue

  const sizes = {}
  for (const { col, size } of SIZE_COLS) {
    const status = parseSizeCell(row[col])
    if (status) {
      sizes[size] = status
      current.sizeSet.add(size)
    }
  }

  current.colors.push({
    name: colorName,
    // Seed fallback path; runtime prefers catalogImagePath (RA.MOC_* files).
    image_url: `/images/RA.MOC_${current.itemNumber}_${colorSlug(colorName)}.jpg`,
    sizes,
  })
}

const lines = []
lines.push('-- Auto-generated from RA-MOC-PRODUCTS-V2.xlsx')
lines.push('-- Re-run: npm run generate-seed')
lines.push('')
lines.push('-- Upsert catalog rows by sku (item number).')
lines.push('')

for (const product of products.values()) {
  const availableSizes = ['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL'].filter((s) =>
    product.sizeSet.has(s)
  )
  const firstImage = product.colors[0]?.image_url || null
  const colorsJson = JSON.stringify(product.colors)

  lines.push(`INSERT INTO ra_moc_products (`)
  lines.push(`  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active`)
  lines.push(`) VALUES (`)
  lines.push(`  ${sqlString(product.name)},`)
  lines.push(`  NULL,`)
  lines.push(`  ${sqlString(product.itemNumber)},`)
  lines.push(`  ${sqlString(product.itemNumber)},`)
  lines.push(`  ${firstImage ? sqlString(firstImage) : 'NULL'},`)
  lines.push(
    availableSizes.length
      ? `  ARRAY[${availableSizes.map(sqlString).join(', ')}]::TEXT[],`
      : `  NULL,`
  )
  lines.push(`  ${sqlString(colorsJson)}::JSONB,`)
  lines.push(`  ${product.sizeChartUrl ? sqlString(product.sizeChartUrl) : 'NULL'},`)
  lines.push(`  ${product.sortOrder},`)
  lines.push(`  TRUE`)
  lines.push(`)`)
  lines.push(`ON CONFLICT (sku) DO UPDATE SET`)
  lines.push(`  name = EXCLUDED.name,`)
  lines.push(`  item_number = EXCLUDED.item_number,`)
  lines.push(`  image_url = EXCLUDED.image_url,`)
  lines.push(`  available_sizes = EXCLUDED.available_sizes,`)
  lines.push(`  colors = EXCLUDED.colors,`)
  lines.push(`  size_chart_url = EXCLUDED.size_chart_url,`)
  lines.push(`  sort_order = EXCLUDED.sort_order,`)
  lines.push(`  active = EXCLUDED.active;`)
  lines.push('')
}

fs.writeFileSync(outPath, lines.join('\n'), 'utf8')
console.log(`Wrote ${products.size} products → ${outPath}`)
