CREATE TABLE ip_data AS (
  SELECT * FROM 'data/providers/all.parquet' ORDER BY cloud_provider, cidr_block
);
