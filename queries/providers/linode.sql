CREATE TABLE linode_ip_data AS (
  SELECT DISTINCT
    cidr_block AS cidr_block,
    STR_SPLIT(cidr_block, '/')[1] AS ip_address,
    CAST(STR_SPLIT(cidr_block, '/')[2] AS INTEGER) AS ip_address_mask,
    CAST(pow(2, 32-CAST(STR_SPLIT(cidr_block, '/')[2] AS INTEGER)) AS INTEGER) AS ip_address_cnt,
     region
  FROM
    read_csv_auto('https://geoip.linode.com/', ignore_errors = true, skip = 3, header = false, delim = ',', columns = {
      'cidr_block': VARCHAR,
      'country': VARCHAR,
      'region': VARCHAR,
      'city': VARCHAR,
      'postal_code': VARCHAR
    })
  WHERE
    cidr_block NOT LIKE '%::%'
);