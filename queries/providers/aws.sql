CREATE TABLE aws_ip_data AS (
  SELECT DISTINCT
    prefixes.cidr_block,
    prefixes.ip_address,
    prefixes.ip_address_mask,
    CAST(pow(2, 32-prefixes.ip_address_mask) AS INTEGER) AS ip_address_cnt,
    prefixes.region
  FROM (
    SELECT
      prefix_object.ip_prefix AS cidr_block,
      STR_SPLIT(prefix_object.ip_prefix, '/')[1] AS ip_address,
      CAST(STR_SPLIT(prefix_object.ip_prefix, '/')[2] AS INTEGER) AS ip_address_mask,
      prefix_object.region
    FROM (
      SELECT unnest(prefixes) AS prefix_object FROM 'https://ip-ranges.amazonaws.com/ip-ranges.json'
    )
  ) prefixes
  ORDER BY 
    prefixes.cidr_block ASC
);
