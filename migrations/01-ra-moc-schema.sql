-- MOC appreciation gift catalog + orders.
-- Same Supabase project as other RA stores; ra_moc_* names only.

CREATE TABLE IF NOT EXISTS ra_moc_products (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  sku TEXT UNIQUE NOT NULL,
  item_number TEXT NOT NULL,
  image_url TEXT,
  -- Sizes that appear for this style somewhere in the sheet (excludes pure "-" columns).
  available_sizes TEXT[],
  -- Per-color soft inventory:
  -- [{"name":"Black","sizes":{"XS":"available","S":"unavailable"},"image_url":"..."}]
  colors JSONB,
  -- SanMar spec sheet, when the catalog row has one.
  size_chart_url TEXT,
  sort_order INTEGER DEFAULT 0,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_ra_moc_products_active ON ra_moc_products(active);
CREATE INDEX IF NOT EXISTS idx_ra_moc_products_sort ON ra_moc_products(sort_order);

ALTER TABLE ra_moc_products ENABLE ROW LEVEL SECURITY;

CREATE POLICY "ra_moc_products are viewable by everyone"
  ON ra_moc_products FOR SELECT
  USING (true);

-- Flat one-product orders — no pricing. Logo is always cobranded MOC.
CREATE TABLE IF NOT EXISTS ra_moc_orders (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  order_number TEXT UNIQUE NOT NULL,
  email TEXT NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  product_id UUID REFERENCES ra_moc_products(id) ON DELETE SET NULL,
  product_name TEXT NOT NULL,
  item_number TEXT NOT NULL,
  sku TEXT NOT NULL,
  color TEXT,
  size TEXT,
  logo TEXT NOT NULL CHECK (logo IN ('MOC')),
  shipping_location_id TEXT NOT NULL,
  shipping_name TEXT NOT NULL,
  shipping_attention TEXT,
  shipping_address TEXT NOT NULL,
  shipping_address2 TEXT,
  shipping_city TEXT NOT NULL,
  shipping_state TEXT NOT NULL,
  shipping_zip TEXT NOT NULL,
  shipping_country TEXT DEFAULT 'USA',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_ra_moc_orders_order_number ON ra_moc_orders(order_number);
-- One order per email, except the test login (see migrations/03).
CREATE UNIQUE INDEX IF NOT EXISTS idx_ra_moc_orders_one_per_email
  ON ra_moc_orders (email)
  WHERE email <> 'josh.rakosky@proforma.com';
CREATE INDEX IF NOT EXISTS idx_ra_moc_orders_created_at ON ra_moc_orders(created_at);

ALTER TABLE ra_moc_orders ENABLE ROW LEVEL SECURITY;

CREATE POLICY "ra_moc_orders are insertable"
  ON ra_moc_orders FOR INSERT
  WITH CHECK (true);

CREATE POLICY "ra_moc_orders are viewable by everyone"
  ON ra_moc_orders FOR SELECT
  USING (true);
