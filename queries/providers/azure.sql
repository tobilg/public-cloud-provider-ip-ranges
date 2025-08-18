CREATE TABLE azure_ip_data AS (
  SELECT
    cidr_block,
    ip_address,
    ip_address_mask,
    ip_address_cnt,
    CASE
      WHEN region = '' THEN 'No region'
      ELSE region
    END AS region
  FROM (
    SELECT DISTINCT
      prefixes AS cidr_block,
      STR_SPLIT(prefixes, '/')[1] AS ip_address,
      CAST(STR_SPLIT(prefixes, '/')[2] AS INTEGER) AS ip_address_mask,
      CAST(pow(2, 32-CAST(STR_SPLIT(prefixes, '/')[2] AS INTEGER)) AS INTEGER) AS ip_address_cnt,
      region,
      RANK() OVER (PARTITION BY prefixes ORDER BY prefixes asc, region desc) as rank
    FROM (
      SELECT DISTINCT
        prop.region AS region,
        UNNEST(prop.addressPrefixes) AS prefixes
      FROM (
        SELECT 
          values.properties AS prop
        FROM (
          SELECT 
            unnest(values) AS values
          FROM
            read_json_auto('###AZURE_PUBLIC_CLOUD_URL###', maximum_object_size=20000000)
        )
        UNION ALL
        SELECT 
          values.properties AS prop
        FROM (
          SELECT 
            unnest(values) AS values
          FROM
            read_json_auto('###AZURE_US_GOVERNMENT_CLOUD_URL###', maximum_object_size=20000000)
        )
        UNION ALL
        SELECT 
          values.properties AS prop
        FROM (
          SELECT 
            unnest(values) AS values
          FROM
            read_json_auto('###AZURE_CHINA_CLOUD_URL###', maximum_object_size=20000000)
        )
        UNION ALL
        SELECT 
          values.properties AS prop
        FROM (
          SELECT 
            unnest(values) AS values
          FROM
            read_json_auto('###AZURE_GERMANY_CLOUD_URL###', maximum_object_size=20000000)
        )
      )
    )
  WHERE
    prefixes NOT LIKE '%::%'
  ) s
WHERE 
  s.rank = 1
ORDER BY 
  cidr_block ASC
);