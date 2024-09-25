CREATE OR REPLACE MACRO network_from_cidr(cidr_range) AS (
  cast(string_split(string_split(cidr_range, '/')[1], '.')[1] as bigint) * (256 * 256 * 256) +
  cast(string_split(string_split(cidr_range, '/')[1], '.')[2] as bigint) * (256 * 256      ) +
  cast(string_split(string_split(cidr_range, '/')[1], '.')[3] as bigint) * (256            ) +
  cast(string_split(string_split(cidr_range, '/')[1], '.')[4] as bigint)
);

CREATE OR REPLACE MACRO broadcast_from_cidr(cidr_range) AS (
  cast(string_split(string_split(cidr_range, '/')[1], '.')[1] as bigint) * (256 * 256 * 256) +
  cast(string_split(string_split(cidr_range, '/')[1], '.')[2] as bigint) * (256 * 256      ) +
  cast(string_split(string_split(cidr_range, '/')[1], '.')[3] as bigint) * (256            ) +
  cast(string_split(string_split(cidr_range, '/')[1], '.')[4] as bigint)) + 
  cast(pow(256, (32 - cast(string_split(cidr_range, '/')[2] as bigint)) / 8) - 1 as bigint
);

CREATE OR REPLACE MACRO is_ip_within_cidr(ip, cidr_range) AS (
  network_from_cidr(ip || '/32') >= network_from_cidr(cidr_range) AND network_from_cidr(ip || '/32') <= broadcast_from_cidr(cidr_range)
);

CREATE TABLE ip_data AS (
  SELECT *, network_from_cidr(cidr_block) AS network, broadcast_from_cidr(cidr_block) AS broadcast FROM 'data/providers/all.parquet' ORDER BY cloud_provider, cidr_block
);
