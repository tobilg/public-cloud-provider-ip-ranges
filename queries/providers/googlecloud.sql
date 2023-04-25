CREATE TABLE google_ip_data AS (
  SELECT DISTINCT
    prefixes.cidr_block,
    prefixes.ip_address,
    prefixes.ip_address_mask,
    CAST(pow(2, 32-prefixes.ip_address_mask) AS INTEGER) AS ip_address_cnt,
    prefixes.region
  FROM (
    SELECT
      prefix_object.ipv4Prefix AS cidr_block,
      STR_SPLIT(prefix_object.ipv4Prefix, '/')[1] AS ip_address,
      CAST(STR_SPLIT(prefix_object.ipv4Prefix, '/')[2] AS INTEGER) AS ip_address_mask,
      prefix_object.scope as region
    FROM (
      SELECT unnest(prefixes) AS prefix_object FROM 'https://www.gstatic.com/ipranges/cloud.json'
    )
    WHERE
      prefix_object.ipv4Prefix IS NOT NULL
  ) prefixes
);
