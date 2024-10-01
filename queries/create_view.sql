CREATE VIEW ip_data AS (
  SELECT 'AWS' as cloud_provider, cidr_block, ip_address, ip_address_mask, ip_address_cnt, region FROM aws_ip_data
  UNION ALL
  SELECT 'Azure' as cloud_provider, cidr_block, ip_address, ip_address_mask, ip_address_cnt, region FROM azure_ip_data
  UNION ALL
  SELECT 'CloudFlare' as cloud_provider, cidr_block, ip_address, ip_address_mask, ip_address_cnt, region FROM cloudflare_ip_data
  UNION ALL
  SELECT 'DigitalOcean' as cloud_provider, cidr_block, ip_address, ip_address_mask, ip_address_cnt, region FROM digitalocean_ip_data
  UNION ALL
  SELECT 'Fastly' as cloud_provider, cidr_block, ip_address, ip_address_mask, ip_address_cnt, region FROM fastly_ip_data
  UNION ALL
  SELECT 'Google Cloud' as cloud_provider, cidr_block, ip_address, ip_address_mask, ip_address_cnt, region FROM google_ip_data
  UNION ALL
  SELECT 'Linode' as cloud_provider, cidr_block, ip_address, ip_address_mask, ip_address_cnt, region FROM linode_ip_data
  UNION ALL
  SELECT 'Oracle' as cloud_provider, cidr_block, ip_address, ip_address_mask, ip_address_cnt, region FROM oracle_ip_data
);
