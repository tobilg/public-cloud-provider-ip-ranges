CREATE TABLE oracle_ip_data AS (
  SELECT DISTINCT
    prefixes.cidr AS cidr_block,
    STR_SPLIT(prefixes.cidr, '/')[1] AS ip_address,
    CAST(STR_SPLIT(prefixes.cidr, '/')[2] AS INTEGER) AS ip_address_mask,
    CAST(pow(2, 32-CAST(STR_SPLIT(prefixes.cidr, '/')[2] AS INTEGER)) AS INTEGER) AS ip_address_cnt,
    CASE
      WHEN region = '' THEN 'No region'
      ELSE region
    END AS region
  FROM (
    SELECT DISTINCT
      region,
      UNNEST(cidrs) AS prefixes
    FROM (
      SELECT 
        regions.region AS region,
        regions.cidrs AS cidrs
      FROM (
        SELECT 
          unnest(regions) AS regions
        FROM
          read_json_auto('https://docs.oracle.com/en-us/iaas/tools/public_ip_ranges.json', maximum_object_size=10000000)
      )
    )
  ) prefixes
  ORDER BY 
    prefixes.cidr ASC
);
