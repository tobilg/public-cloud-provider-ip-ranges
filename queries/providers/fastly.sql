CREATE TABLE fastly_ip_data AS (
  SELECT DISTINCT
    prefixes AS cidr_block,
    STR_SPLIT(prefixes, '/')[1] AS ip_address,
    CAST(STR_SPLIT(prefixes, '/')[2] AS INTEGER) AS ip_address_mask,
    CAST(pow(2, 32-CAST(STR_SPLIT(prefixes, '/')[2] AS INTEGER)) AS INTEGER) AS ip_address_cnt,
    'No region' AS region
  FROM (
    SELECT
      UNNEST(addresses) AS prefixes
    FROM
      read_json_auto('https://api.fastly.com/public-ip-list')
  )
);
