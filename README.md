# Republic Airways MOC Appreciation Gift Store

One-product gift ordering for Maintenance Operation Control (MOC). Cobranded Republic x MOC design; single ship-to at RepHQ.

## Flow

1. Enter email (`/`)
2. Instructions (`/instructions`)
3. Pick 1 product + color/size (`/products`) — unavailable sizes greyed out
4. Name + locked RepHQ ship-to (`/shipping`)
5. Review → submit → confirmation (`RAMOC-###`)

## Setup

```bash
npm install
cp .env.local.example .env.local   # same Supabase project as SOC is fine
```

Run SQL in Supabase (new `ra_moc_*` tables alongside existing stores):

1. `migrations/01-ra-moc-schema.sql`
2. `migrations/02-ra-moc-seed-products.sql`
3. `migrations/03-allow-multi-order-test-email.sql` (optional; keeps test multi-order exception)

Regenerate seed from the spreadsheet:

```bash
npm run generate-seed
# or: node scripts/generate-catalog-seed.mjs "C:\path\to\RA-MOC-PRODUCTS-V2.xlsx"
```

```bash
npm run dev
```

## Assets

- Republic logo: `public/images/RA-Logo.png`
- Product photos: drop ZIP files into `public/images/` as `RA.MOC_{ItemNumber}_{ColorToken}.jpg`
  - Example: `RA.MOC_NKIO8126_COOL.GREY.HTHR.jpg`
  - `Hthr` in source art = Heather
- Background video: currently reuses `/videos/SOC-Background-1.mp4` until a MOC asset is provided

## Shipping

Locked RepHQ destination in `lib/shipping-locations.ts`:

- Republic Airways HQ
- Attn: Program Manager
- 2 Brickyard Lane, Carmel, IN 46032
