# public-cloud-provider-ip-ranges
This repository provides unified and cleaned datasets for public cloud provider IP ranges, as CSV and Parquet files.

## Data sources
The following public cloud providers are covered by this repo:

* [AWS](https://ip-ranges.amazonaws.com/ip-ranges.json)
* [Azure](https://download.microsoft.com/download/7/1/D/71D86715-5596-4529-9B13-DA13A5DE5B63/ServiceTags_Public_20230508.json)
* [CloudFlare](https://www.cloudflare.com/ips-v4)
* [DigitalOcean](https://digitalocean.com/geo/google.csv)
* [Fastly](https://api.fastly.com/public-ip-list)
* [Google Cloud](https://www.gstatic.com/ipranges/cloud.json)
* [Oracle Cloud](https://docs.oracle.com/en-us/iaas/tools/public_ip_ranges.json)

## Generated data
The generated data can be found in the [data](data/) directory.

### All providers combined
* All: [CSV](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/all.csv) / [Parquet](https://github.com/tobilg/public-cloud-provider-ip-ranges/raw/main/data/providers/all.parquet) / [JSON](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/all.json)

### Single providers
* AWS: [CSV](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/aws.csv) / [Parquet](https://github.com/tobilg/public-cloud-provider-ip-ranges/raw/main/data/providers/aws.parquet) / [JSON](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/aws.json)
* Azure: [CSV](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/azure.csv) / [Parquet](https://github.com/tobilg/public-cloud-provider-ip-ranges/raw/main/data/providers/azure.parquet) / [JSON](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/azure.json)
* CloudFlare: [CSV](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/cloudflare.csv) / [Parquet](https://github.com/tobilg/public-cloud-provider-ip-ranges/raw/main/data/providers/cloudflare.parquet) / [JSON](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/cloudflare.json)
* DigitalOcean: [CSV](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/digitalocean.csv) / [Parquet](https://github.com/tobilg/public-cloud-provider-ip-ranges/raw/main/data/providers/digitalocean.parquet) / [JSON](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/digitalocean.json)
* Fastly: [CSV](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/fastly.csv) / [Parquet](https://github.com/tobilg/public-cloud-provider-ip-ranges/raw/main/data/providers/fastly.parquet) / [JSON](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/fastly.json)
* Google Cloud: [CSV](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/googlecloud.csv) / [Parquet](https://github.com/tobilg/public-cloud-provider-ip-ranges/raw/main/data/providers/googlecloud.parquet) / [JSON](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/googlecloud.json)
* Oracle Cloud: [CSV](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/oracle.csv) / [Parquet](https://github.com/tobilg/public-cloud-provider-ip-ranges/raw/main/data/providers/oracle.parquet) / [JSON](https://raw.githubusercontent.com/tobilg/public-cloud-provider-ip-ranges/main/data/providers/oracle.json)

## Data format
There are three versions of each dataset, a CSV and a Parquet version in columnar style, and a JSON version.

### Columnar schema
The data format of both columnar versions looks like this:

| Column name | Data type | Description |
| ----------- | --------- | ----------- |
| cloud_provider | VARCHAR | The public cloud provider name |
| cidr_block | VARCHAR | The CIDR block, e.g. `10.0.0.0/32` |
| ip_address | VARCHAR |The IP address, e.g. `10.0.0.0` |
| ip_address_mask | INTEGER | The IP address mask, e.g. `32` |
| ip_address_cnt | INTEGER | The number of IP addresses in this CIDR block |
| region | VARCHAR | The pubilic cloud provider region information (if given) |

### JSON schema
The JSON schema of the exported data is

```json
{
    "$schema": "https://json-schema.org/draft-07/schema",
    "title": "Public Cloud Provider JSON export schema",
    "type": "array",
    "items": {
        "title": "CIDR block record",
        "type": "object",
        "required": [
            "cidr_block",
            "ip_address",
            "ip_address_mask",
            "ip_address_cnt",
            "region"
        ],
        "properties": {
            "cidr_block": {
                "title": "The CIDR block",
                "type": "string",
                "examples": [
                    "129.146.0.0/21"
                ]
            },
            "ip_address": {
                "title": "The IP address",
                "type": "string",
                "examples": [
                    "129.146.0.0"
                ]
            },
            "ip_address_mask": {
                "title": "The IP address mask",
                "type": "integer",
                "examples": [
                    21
                ]
            },
            "ip_address_cnt": {
                "title": "The number of IP addresses in this CIDR block",
                "type": "integer",
                "examples": [
                    2048
                ]
            },
            "region": {
                "title": "The respective public cloud provider region",
                "type": "string",
                "examples": [
                    "us-phoenix-1"
                ]
            }
        },
        "examples": [{
            "cidr_block": "129.146.0.0/21",
            "ip_address": "129.146.0.0",
            "ip_address_mask": 21,
            "ip_address_cnt": 2048,
            "region": "us-phoenix-1"
        }]
    }
}
```

## Automatic updates
The CI pipeline will check for AWS IAM docs updates everyday at 4AM UTC, and automatically publish a new patch version if updates are detected.
