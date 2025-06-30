COPY (SELECT * FROM ip_data ORDER BY cloud_provider, cidr_block) TO 'data/providers/all.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data ORDER BY cloud_provider, cidr_block) TO 'data/providers/all.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM ip_data ORDER BY cloud_provider, cidr_block) TO 'data/providers/all.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'AWS' ORDER BY cloud_provider, cidr_block) TO 'data/providers/aws.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'AWS' ORDER BY cloud_provider, cidr_block) TO 'data/providers/aws.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM aws_ip_data ORDER BY cidr_block) TO 'data/providers/aws.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Azure' ORDER BY cloud_provider, cidr_block) TO 'data/providers/azure.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Azure' ORDER BY cloud_provider, cidr_block) TO 'data/providers/azure.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM azure_ip_data ORDER BY cidr_block) TO 'data/providers/azure.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'CloudFlare' ORDER BY cloud_provider, cidr_block) TO 'data/providers/cloudflare.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'CloudFlare' ORDER BY cloud_provider, cidr_block) TO 'data/providers/cloudflare.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM cloudflare_ip_data ORDER BY cidr_block) TO 'data/providers/cloudflare.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'DigitalOcean' ORDER BY cloud_provider, cidr_block) TO 'data/providers/digitalocean.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'DigitalOcean' ORDER BY cloud_provider, cidr_block) TO 'data/providers/digitalocean.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM digitalocean_ip_data ORDER BY cidr_block) TO 'data/providers/digitalocean.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Fastly' ORDER BY cloud_provider, cidr_block) TO 'data/providers/fastly.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Fastly' ORDER BY cloud_provider, cidr_block) TO 'data/providers/fastly.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM fastly_ip_data ORDER BY cidr_block) TO 'data/providers/fastly.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Google Cloud' ORDER BY cloud_provider, cidr_block) TO 'data/providers/googlecloud.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Google Cloud' ORDER BY cloud_provider, cidr_block) TO 'data/providers/googlecloud.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM google_ip_data ORDER BY cidr_block) TO 'data/providers/googlecloud.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Linode' ORDER BY cloud_provider, cidr_block) TO 'data/providers/linode.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Linode' ORDER BY cloud_provider, cidr_block) TO 'data/providers/linode.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM oracle_ip_data ORDER BY cidr_block) TO 'data/providers/linode.json' (ARRAY true);

COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Oracle' ORDER BY cloud_provider, cidr_block) TO 'data/providers/oracle.csv' WITH (HEADER 1, DELIMITER ',');
COPY (SELECT * FROM ip_data WHERE cloud_provider = 'Oracle' ORDER BY cloud_provider, cidr_block) TO 'data/providers/oracle.parquet' (FORMAT 'parquet', COMPRESSION 'SNAPPY');
COPY (SELECT * FROM oracle_ip_data ORDER BY cidr_block) TO 'data/providers/oracle.json' (ARRAY true);
