-- Auto-generated from RA-MOC-PRODUCTS-V2.xlsx
-- Re-run: npm run generate-seed

-- Upsert catalog rows by sku (item number).

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Nike Dri-Fit Primary Hoodie',
  NULL,
  'NKIO8126',
  'NKIO8126',
  '/images/RA.MOC_NKIO8126_Black.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_NKIO8126_Black.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Cool Grey Heather","image_url":"/images/RA.MOC_NKIO8126_CoolGreyHeather.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Navy Heather","image_url":"/images/RA.MOC_NKIO8126_NavyHeather.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75273_Black/specSheetMeasurements',
  1,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Nike Dri-Fit Primary Crew',
  NULL,
  'NKIO8127',
  'NKIO8127',
  '/images/RA.MOC_NKIO8127_Black.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_NKIO8127_Black.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Navy Heather","image_url":"/images/RA.MOC_NKIO8127_NavyHeather.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75274_Black/specSheetMeasurements',
  2,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Nike Dri-Fit Primary Quarter-Zip',
  NULL,
  'NKIO8128',
  'NKIO8128',
  '/images/RA.MOC_NKIO8128_Black.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_NKIO8128_Black.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Cool Grey Heather","image_url":"/images/RA.MOC_NKIO8128_CoolGreyHeather.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Navy Heather","image_url":"/images/RA.MOC_NKIO8128_NavyHeather.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75275_Black/specSheetMeasurements',
  3,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Nike Women''s Dri-Fit Primary Quarter-Zip',
  NULL,
  'NKIO8129',
  'NKIO8129',
  '/images/RA.MOC_NKIO8129_Black.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_NKIO8129_Black.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Cool Grey Heather","image_url":"/images/RA.MOC_NKIO8129_CoolGreyHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Navy Heather","image_url":"/images/RA.MOC_NKIO8129_NavyHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75276_Black/specSheetMeasurements',
  4,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'MiiR® Kivu 1/4-Zip',
  NULL,
  'MRA235',
  'MRA235',
  '/images/RA.MOC_MRA235_Black.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_MRA235_Black.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75882_PitchBlack/specSheetMeasurements',
  5,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'MiiR® Women''s Kivu 1/4-Zip',
  NULL,
  'MRAW235',
  'MRAW235',
  '/images/RA.MOC_MRAW235_Black.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_MRAW235_Black.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75883_PitchBlack/specSheetMeasurements',
  6,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Nike Dri-Fit Stride 1/2-Zip',
  NULL,
  'NKIO8137',
  'NKIO8137',
  '/images/RA.MOC_NKIO8137_Anthracite.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL', '3XL']::TEXT[],
  '[{"name":"Anthracite","image_url":"/images/RA.MOC_NKIO8137_Anthracite.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Black","image_url":"/images/RA.MOC_NKIO8137_Black.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Black Heather","image_url":"/images/RA.MOC_NKIO8137_BlackHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Navy","image_url":"/images/RA.MOC_NKIO8137_Navy.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Royal","image_url":"/images/RA.MOC_NKIO8137_Royal.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Royal Heather","image_url":"/images/RA.MOC_NKIO8137_RoyalHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Scarlet","image_url":"/images/RA.MOC_NKIO8137_Scarlet.jpg","sizes":{"S":"unavailable","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/74375_Black/specSheetMeasurements',
  7,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Nike Women''s Dri-Fit Stride 1/2-Zip',
  NULL,
  'NKIO8141',
  'NKIO8141',
  '/images/RA.MOC_NKIO8141_Anthracite.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL']::TEXT[],
  '[{"name":"Anthracite","image_url":"/images/RA.MOC_NKIO8141_Anthracite.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Black","image_url":"/images/RA.MOC_NKIO8141_Black.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Black Heather","image_url":"/images/RA.MOC_NKIO8141_BlackHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Navy","image_url":"/images/RA.MOC_NKIO8141_Navy.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Royal","image_url":"/images/RA.MOC_NKIO8141_Royal.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Royal Heather","image_url":"/images/RA.MOC_NKIO8141_RoyalHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Scarlet","image_url":"/images/RA.MOC_NKIO8141_Scarlet.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/74376_Black/specSheetMeasurements',
  8,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'MiiR® Kumo 1/4-Snap Pullover',
  NULL,
  'MRA220',
  'MRA220',
  '/images/RA.MOC_MRA220_IndigoNavy.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Indigo Navy","image_url":"/images/RA.MOC_MRA220_IndigoNavy.jpg","sizes":{"XS":"available","S":"available","M":"unavailable","L":"unavailable","XL":"unavailable","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Pitch Black","image_url":"/images/RA.MOC_MRA220_PitchBlack.jpg","sizes":{"XS":"available","S":"available","M":"unavailable","L":"unavailable","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75675_PitchBlack/specSheetMeasurements',
  9,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'MiiR® Women''s Kumo 1/4-Zip Pullover',
  NULL,
  'MRAW221',
  'MRAW221',
  '/images/RA.MOC_MRAW221_IndigoNavy.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Indigo Navy","image_url":"/images/RA.MOC_MRAW221_IndigoNavy.jpg","sizes":{"XS":"available","S":"unavailable","M":"unavailable","L":"available","XL":"available","2XL":"unavailable","3XL":"available","4XL":"available"}},{"name":"Pitch Black","image_url":"/images/RA.MOC_MRAW221_PitchBlack.jpg","sizes":{"XS":"available","S":"unavailable","M":"unavailable","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75873_PitchBlack/specSheetMeasurements',
  10,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Tommy Bahama® Coconut Bay 1/2-Zip',
  NULL,
  'ST228073TB',
  'ST228073TB',
  '/images/RA.MOC_ST228073TB_Black.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL', '3XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_ST228073TB_Black.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Dockside Blue","image_url":"/images/RA.MOC_ST228073TB_DocksideBlue.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Hazy","image_url":"/images/RA.MOC_ST228073TB_Hazy.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Ultimate Grey","image_url":"/images/RA.MOC_ST228073TB_UltimateGrey.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/79573_Black/specSheetMeasurements',
  11,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Tommy Bahama® Women''s Coconut Bay 1/2-Zip',
  NULL,
  'SW222350TB',
  'SW222350TB',
  '/images/RA.MOC_SW222350TB_Black.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_SW222350TB_Black.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Dockside Blue","image_url":"/images/RA.MOC_SW222350TB_DocksideBlue.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Hazy","image_url":"/images/RA.MOC_SW222350TB_Hazy.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Light Sky Blue","image_url":"/images/RA.MOC_SW222350TB_LightSkyBlue.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/79574_Black/specSheetMeasurements',
  12,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'MiiR® Kivu Hybrid Full-Zip Hooded Jacket',
  NULL,
  'MRA230',
  'MRA230',
  '/images/RA.MOC_MRA230_DeepLake.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Deep Lake","image_url":"/images/RA.MOC_MRA230_DeepLake.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Indigo Navy","image_url":"/images/RA.MOC_MRA230_IndigoNavy.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Pitch Black","image_url":"/images/RA.MOC_MRA230_PitchBlack.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75875_PitchBlack/specSheetMeasurements',
  13,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'MiiR® Women''s Kivu Hybrid Full-Zip Hooded Jacket',
  NULL,
  'MRAW231',
  'MRAW231',
  '/images/RA.MOC_MRAW231_Alabaster.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Alabaster","image_url":"/images/RA.MOC_MRAW231_Alabaster.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Indigo Navy","image_url":"/images/RA.MOC_MRAW231_IndigoNavy.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Pitch Black","image_url":"/images/RA.MOC_MRAW231_PitchBlack.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75876_PitchBlack/specSheetMeasurements',
  14,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Eddie Bauer® Stretch Soft Shell Jacket',
  NULL,
  'EB544',
  'EB544',
  '/images/RA.MOC_EB544_DeepBlack.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Deep Black","image_url":"/images/RA.MOC_EB544_DeepBlack.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Iron Gate","image_url":"/images/RA.MOC_EB544_IronGate.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"River Blue Navy","image_url":"/images/RA.MOC_EB544_RiverBlueNavy.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/22573_DeepBlack/specSheetMeasurements',
  15,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Eddie Bauer® Women''s Stretch Soft Shell Jacket',
  NULL,
  'EB545',
  'EB545',
  '/images/RA.MOC_EB545_DeepBlack.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Deep Black","image_url":"/images/RA.MOC_EB545_DeepBlack.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Iron Gate","image_url":"/images/RA.MOC_EB545_IronGate.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"River Blue Navy","image_url":"/images/RA.MOC_EB545_RiverBlueNavy.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/22574_DeepBlack/specSheetMeasurements',
  16,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Eddie Bauer® WeatherEdge® Jacket',
  NULL,
  'EB558',
  'EB558',
  '/images/RA.MOC_EB558_Black.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_EB558_Black.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Cobalt-Navy","image_url":"/images/RA.MOC_EB558_CobaltNavy.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Metal-Steel","image_url":"/images/RA.MOC_EB558_MetalSteel.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/9000_Black/specSheetMeasurements',
  17,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Eddie Bauer® Women''s WeatherEdge® Jacket',
  NULL,
  'EB559',
  'EB559',
  '/images/RA.MOC_EB559_Black.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_EB559_Black.jpg","sizes":{"XS":"available","S":"unavailable","M":"unavailable","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Cobalt-Navy","image_url":"/images/RA.MOC_EB559_CobaltNavy.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Metal-Steel","image_url":"/images/RA.MOC_EB559_MetalSteel.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/9001_Black/specSheetMeasurements',
  18,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Carhartt® Textured Full-Zip Fleece Jacket',
  NULL,
  'CT106416',
  'CT106416',
  '/images/RA.MOC_CT106416_Black.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL', '3XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_CT106416_Black.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Carbon Heather","image_url":"/images/RA.MOC_CT106416_CarbonHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Heather Grey","image_url":"/images/RA.MOC_CT106416_HeatherGrey.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Navy","image_url":"/images/RA.MOC_CT106416_Navy.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/47894_Black/specSheetMeasurements',
  19,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'Carhartt® Women''s Textured Full-Zip Fleece Jacket',
  NULL,
  'CT106419',
  'CT106419',
  '/images/RA.MOC_CT106419_Black.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_CT106419_Black.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Carbon Heather","image_url":"/images/RA.MOC_CT106419_CarbonHeather.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Heather Grey","image_url":"/images/RA.MOC_CT106419_HeatherGrey.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Navy","image_url":"/images/RA.MOC_CT106419_Navy.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/47895_Black/specSheetMeasurements',
  20,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'The North Face® Ridgewall Soft Shell Vest',
  NULL,
  'NF0A3LGZ',
  'NF0A3LGZ',
  '/images/RA.MOC_NF0A3LGZ_TNFBlack.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL', '3XL']::TEXT[],
  '[{"name":"TNF Black","image_url":"/images/RA.MOC_NF0A3LGZ_TNFBlack.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"TNF Dark Grey Heather","image_url":"/images/RA.MOC_NF0A3LGZ_TNFDarkGreyHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/8655_TNFBlack/specSheetMeasurements',
  21,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'The North Face® Women''s Ridgewall Soft Shell Vest',
  NULL,
  'NF0A3LH1',
  'NF0A3LH1',
  '/images/RA.MOC_NF0A3LH1_TNFBlack.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL']::TEXT[],
  '[{"name":"TNF Black","image_url":"/images/RA.MOC_NF0A3LH1_TNFBlack.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"TNF Dark Grey Heather","image_url":"/images/RA.MOC_NF0A3LH1_TNFDarkGreyHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/8656_TNFBlack/specSheetMeasurements',
  22,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'MiiR® Sashiko Stretch Puffy Vest',
  NULL,
  'MRA442',
  'MRA442',
  '/images/RA.MOC_MRA442_DeepLake.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Deep Lake","image_url":"/images/RA.MOC_MRA442_DeepLake.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Pitch Black","image_url":"/images/RA.MOC_MRA442_PitchBlack.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75886_PitchBlack/specSheetMeasurements',
  23,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'MiiR® Women’s Sashiko Stretch Puffy Vest',
  NULL,
  'MRAW442',
  'MRAW442',
  '/images/RA.MOC_MRAW442_DeepLake.jpg',
  ARRAY['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL', '4XL']::TEXT[],
  '[{"name":"Deep Lake","image_url":"/images/RA.MOC_MRAW442_DeepLake.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}},{"name":"Pitch Black","image_url":"/images/RA.MOC_MRAW442_PitchBlack.jpg","sizes":{"XS":"available","S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available","4XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/75887_PitchBlack/specSheetMeasurements',
  24,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'The North Face® Skyline Full-Zip Fleece Jacket',
  NULL,
  'NF0A7V64',
  'NF0A7V64',
  '/images/RA.MOC_NF0A7V64_TNFBlack.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL', '3XL']::TEXT[],
  '[{"name":"TNF Black","image_url":"/images/RA.MOC_NF0A7V64_TNFBlack.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"TNF Dark Grey Heather","image_url":"/images/RA.MOC_NF0A7V64_TNFDarkGreyHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Urban Navy Heather","image_url":"/images/RA.MOC_NF0A7V64_UrbanNavyHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/25873_TNFBlack/specSheetMeasurements',
  25,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'The North Face® Women''s Skyline Full-Zip Fleece Jacket',
  NULL,
  'NF0A7V62',
  'NF0A7V62',
  '/images/RA.MOC_NF0A7V62_TNFBlack.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL']::TEXT[],
  '[{"name":"TNF Black","image_url":"/images/RA.MOC_NF0A7V62_TNFBlack.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"TNF Dark Grey Heather","image_url":"/images/RA.MOC_NF0A7V62_TNFDarkGreyHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Urban Navy Heather","image_url":"/images/RA.MOC_NF0A7V62_UrbanNavyHeather.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/25874_TNFBlack/specSheetMeasurements',
  26,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'TravisMathew Cold Bay Vest',
  NULL,
  'TM1MW453',
  'TM1MW453',
  '/images/RA.MOC_TM1MW453_Black.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL', '3XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_TM1MW453_Black.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}},{"name":"Quiet Shade Grey","image_url":"/images/RA.MOC_TM1MW453_QuietShadeGrey.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available","3XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/20079_Black/specSheetMeasurements',
  27,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

INSERT INTO ra_moc_products (
  name, description, sku, item_number, image_url, available_sizes, colors, size_chart_url, sort_order, active
) VALUES (
  'TravisMathew Women''s Cold Bay Vest',
  NULL,
  'TM1LD002',
  'TM1LD002',
  '/images/RA.MOC_TM1LD002_Black.jpg',
  ARRAY['S', 'M', 'L', 'XL', '2XL']::TEXT[],
  '[{"name":"Black","image_url":"/images/RA.MOC_TM1LD002_Black.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}},{"name":"Quiet Shade Grey","image_url":"/images/RA.MOC_TM1LD002_QuietShadeGrey.jpg","sizes":{"S":"available","M":"available","L":"available","XL":"available","2XL":"available"}}]'::JSONB,
  'https://www.sanmar.com/p/31893_Black/specSheetMeasurements',
  28,
  TRUE
)
ON CONFLICT (sku) DO UPDATE SET
  name = EXCLUDED.name,
  item_number = EXCLUDED.item_number,
  image_url = EXCLUDED.image_url,
  available_sizes = EXCLUDED.available_sizes,
  colors = EXCLUDED.colors,
  size_chart_url = EXCLUDED.size_chart_url,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;
