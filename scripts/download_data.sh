#!/bin/bash

# Where to store the db file for DuckDB
DATA_PATH="/tmp/duckdb-database-$(date '+%F').duckdb"

# Download Azure page (URLs change every 14 days)
curl -vvv -L -H "User-Agent: public-cloud-bot/1.0" https://www.microsoft.com/en-US/download/details.aspx?id=56519 -o /tmp/azure-public-cloud.html
curl -vvv -L -H "User-Agent: public-cloud-bot/1.0" https://www.microsoft.com/en-US/download/details.aspx?id=57063 -o /tmp/azure-us-government-cloud.html
curl -vvv -L -H "User-Agent: public-cloud-bot/1.0" https://www.microsoft.com/en-US/download/details.aspx?id=57062 -o /tmp/azure-china-cloud.html
curl -vvv -L -H "User-Agent: public-cloud-bot/1.0" https://www.microsoft.com/en-US/download/details.aspx?id=57064 -o /tmp/azure-germany-cloud.html

# Get URL from Azure page code
AZURE_PUBLIC_CLOUD_URL=$(xmllint --html -xpath "//html/body/div[3]/div/div[2]/main/div/div[1]/div/div/div/section[3]/div/div/div/div/div/a/@href" /tmp/azure-public-cloud.html 2>/dev/null | sed 's/ href="\([^"]*\)"/\1\n/g')
AZURE_US_GOVERNMENT_CLOUD_URL=$(xmllint --html -xpath "//html/body/div[3]/div/div[2]/main/div/div[1]/div/div/div/section[3]/div/div/div/div/div/a/@href" /tmp/azure-us-government-cloud.html 2>/dev/null | sed 's/ href="\([^"]*\)"/\1\n/g')
AZURE_CHINA_CLOUD_URL=$(xmllint --html -xpath "//html/body/div[3]/div/div[2]/main/div/div[1]/div/div/div/section[3]/div/div/div/div/div/a/@href" /tmp/azure-china-cloud.html 2>/dev/null | sed 's/ href="\([^"]*\)"/\1\n/g')
AZURE_GERMANY_CLOUD_URL=$(xmllint --html -xpath "//html/body/div[3]/div/div[2]/main/div/div[1]/div/div/div/section[3]/div/div/div/div/div/a/@href" /tmp/azure-germany-cloud.html 2>/dev/null | sed 's/ href="\([^"]*\)"/\1\n/g')

# Populate Azure script
sed -e "s|###AZURE_PUBLIC_CLOUD_URL###|$AZURE_PUBLIC_CLOUD_URL|" -e "s|###AZURE_US_GOVERNMENT_CLOUD_URL###|$AZURE_US_GOVERNMENT_CLOUD_URL|" -e "s|###AZURE_CHINA_CLOUD_URL###|$AZURE_CHINA_CLOUD_URL|" -e "s|###AZURE_GERMANY_CLOUD_URL###|$AZURE_GERMANY_CLOUD_URL|" queries/providers/azure.sql > queries/providers/azure.current.sql

# Install httpfs extension
duckdb $DATA_PATH < queries/install_extensions.sql

# Load aws data
duckdb $DATA_PATH < queries/providers/aws.sql

# Load azure data
duckdb $DATA_PATH < queries/providers/azure.current.sql

# Download Cloudflare data via curl, DuckDB gives a missign Content-Length header error
curl -S -H "User-Agent: public-cloud-bot/1.0" https://www.cloudflare.com/ips-v4 -o /tmp/cloudflare.txt

# Load cloudflare data
duckdb $DATA_PATH < queries/providers/cloudflare.sql

# Load digitalocean data
duckdb $DATA_PATH < queries/providers/digitalocean.sql

# Load fastly data
duckdb $DATA_PATH < queries/providers/fastly.sql

# Load googlecloud data
duckdb $DATA_PATH < queries/providers/googlecloud.sql

# Load Linode data
duckdb $DATA_PATH < queries/providers/linode.sql

# Load oracle data
duckdb $DATA_PATH < queries/providers/oracle.sql

# Load vultr data
duckdb $DATA_PATH < queries/providers/vultr.sql

# Create view
duckdb $DATA_PATH < queries/create_view.sql

# Cleanup
rm queries/providers/azure.current.sql
