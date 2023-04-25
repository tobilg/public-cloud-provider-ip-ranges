CREATE TABLE digitalocean_ip_data AS (
  SELECT DISTINCT
    prefixes AS cidr_block,
    STR_SPLIT(prefixes, '/')[1] AS ip_address,
    CAST(STR_SPLIT(prefixes, '/')[2] AS INTEGER) AS ip_address_mask,
    CAST(pow(2, 32-CAST(STR_SPLIT(prefixes, '/')[2] AS INTEGER)) AS INTEGER) AS ip_address_cnt,
    'No region' AS region
  FROM (
    SELECT
      column0 AS prefixes
    FROM
      read_csv_auto('https://digitalocean.com/geo/google.csv')
    WHERE
      column0 NOT LIKE '%::%'
  )
);
