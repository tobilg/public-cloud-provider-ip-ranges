COPY (SELECT * FROM ip_data ORDER BY cloud_provider, cidr_block) TO 'data/providers/all.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data ORDER BY cloud_provider, cidr_block) TO 'data/providers/all.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT to_json(list(ip_data)) FROM ip_data ORDER BY cloud_provider, cidr_block) TO 'data/providers/all.json' (FORMAT 'csv', DELIMITER '\0', QUOTE '');

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'AWS' ORDER BY cloud_provider, cidr_block) TO 'data/providers/aws.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'AWS' ORDER BY cloud_provider, cidr_block) TO 'data/providers/aws.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT to_json(list(aws_ip_data)) FROM aws_ip_data) TO 'data/providers/aws.json' (FORMAT 'csv', DELIMITER '\0', QUOTE '');

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Azure' ORDER BY cloud_provider, cidr_block) TO 'data/providers/azure.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Azure' ORDER BY cloud_provider, cidr_block) TO 'data/providers/azure.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT to_json(list(azure_ip_data)) FROM azure_ip_data) TO 'data/providers/azure.json' (FORMAT 'csv', DELIMITER '\0', QUOTE '');

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'CloudFlare' ORDER BY cloud_provider, cidr_block) TO 'data/providers/cloudflare.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'CloudFlare' ORDER BY cloud_provider, cidr_block) TO 'data/providers/cloudflare.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT to_json(list(cloudflare_ip_data)) FROM cloudflare_ip_data) TO 'data/providers/cloudflare.json' (FORMAT 'csv', DELIMITER '\0', QUOTE '');

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'DigitalOcean' ORDER BY cloud_provider, cidr_block) TO 'data/providers/digitalocean.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'DigitalOcean' ORDER BY cloud_provider, cidr_block) TO 'data/providers/digitalocean.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT to_json(list(digitalocean_ip_data)) FROM digitalocean_ip_data) TO 'data/providers/digitalocean.json' (FORMAT 'csv', DELIMITER '\0', QUOTE '');

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Fastly' ORDER BY cloud_provider, cidr_block) TO 'data/providers/fastly.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Fastly' ORDER BY cloud_provider, cidr_block) TO 'data/providers/fastly.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT to_json(list(fastly_ip_data)) FROM fastly_ip_data) TO 'data/providers/fastly.json' (FORMAT 'csv', DELIMITER '\0', QUOTE '');

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Google Cloud' ORDER BY cloud_provider, cidr_block) TO 'data/providers/googlecloud.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Google Cloud' ORDER BY cloud_provider, cidr_block) TO 'data/providers/googlecloud.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT to_json(list(google_ip_data)) FROM google_ip_data) TO 'data/providers/googlecloud.json' (FORMAT 'csv', DELIMITER '\0', QUOTE '');

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Oracle' ORDER BY cloud_provider, cidr_block) TO 'data/providers/oracle.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Oracle' ORDER BY cloud_provider, cidr_block) TO 'data/providers/oracle.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT to_json(list(oracle_ip_data)) FROM oracle_ip_data) TO 'data/providers/oracle.json' (FORMAT 'csv', DELIMITER '\0', QUOTE '');
