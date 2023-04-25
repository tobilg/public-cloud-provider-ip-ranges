# public-cloud-provider-ip-ranges
This repository provides unified and cleaned datasets for public cloud provider IP ranges, as CSV and Parquet files.

## Data sources
The following public cloud providers are covered by this repo:

* [AWS](https://ip-ranges.amazonaws.com/ip-ranges.json)
* [Azure](https://download.microsoft.com/download/7/1/D/71D86715-5596-4529-9B13-DA13A5DE5B63/ServiceTags_Public_20230417.json)
* [CloudFlare](https://www.cloudflare.com/ips-v4)
* [DigitalOcean](https://digitalocean.com/geo/google.csv)
* [Fastly](https://api.fastly.com/public-ip-list)
* [Google Cloud](https://www.gstatic.com/ipranges/cloud.json)
* [Oracle Cloud](https://docs.oracle.com/en-us/iaas/tools/public_ip_ranges.json)

## Data format
There are two versions of each dataset, a CSV and a Parquet version.

The data format of both versions looks like this:

| Column name | Data type | Description |
| ----------- | --------- | ----------- |
| cloud_provider | VARCHAR | The public cloud provider name |
| cidr_block | VARCHAR | The CIDR block, e.g. `10.0.0.0/32` |
| ip_address | VARCHAR |The IP address, e.g. `10.0.0.0` |
| ip_address_mask | INTEGER | The IP address mask, e.g. `32` |
| ip_address_cnt | INTEGER | The number of IP addresses in this CIDR block |
| region | VARCHAR | The pubilic cloud provider region information (if given) |

## Generated data
The generated data can be found in the [data](data/) directory.

### All providers combined
* All: [CSV](data/providers/all.csv) / [Parquet](data/providers/all.parquet)

### Single providers
* AWS: [CSV](raw/main/data/providers/aws.csv) / [Parquet](raw/main/data/providers/aws.parquet)
* Azure: [CSV](raw/main/data/providers/azure.csv) / [Parquet](raw/main/data/providers/azure.parquet)
* CloudFlare: [CSV](raw/main/data/providers/cloudflare.csv) / [Parquet](raw/main/data/providers/cloudflare.parquet)
* DigitalOcean: [CSV](raw/main/data/providers/digitalocean.csv) / [Parquet](raw/main/data/providers/digitalocean.parquet)
* Fastly: [CSV](raw/main/data/providers/fastly.csv) / [Parquet](raw/main/data/providers/fastly.parquet)
* Google Cloud: [CSV](raw/main/data/providers/googlecloud.csv) / [Parquet](raw/main/data/providers/googlecloud.parquet)
* Oracle Cloud: [CSV](raw/main/data/providers/oracle.csv) / [Parquet](raw/main/data/providers/oracle.parquet)
