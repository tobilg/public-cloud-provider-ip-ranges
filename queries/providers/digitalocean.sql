CREATE TABLE digitalocean_ip_data AS (
  SELECT DISTINCT
    cidr_block,
    STR_SPLIT(cidr_block, '/')[1] AS ip_address,
    CAST(STR_SPLIT(cidr_block, '/')[2] AS INTEGER) AS ip_address_mask,
    CAST(pow(2, 32-CAST(STR_SPLIT(cidr_block, '/')[2] AS INTEGER)) AS INTEGER) AS ip_address_cnt,
    region
  FROM (
    SELECT
      cidr_block,
      region
    FROM
      read_csv('https://digitalocean.com/geo/google.csv', header = false, delim = ',', ignore_errors = true, columns = {
        'cidr_block': VARCHAR,
        'country': VARCHAR,
        'region': VARCHAR,
        'city': VARCHAR,
        'unknown': VARCHAR
      })
    WHERE
      cidr_block NOT LIKE '%::%'
  )
);
