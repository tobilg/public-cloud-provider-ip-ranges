#!/bin/bash

# Where to store the db file for DuckDB
DATA_PATH="/tmp/duckdb-database-$(date '+%F').duckdb"

# Install httpfs extension
duckdb $DATA_PATH < queries/install_extensions.sql

# Load aws data
duckdb $DATA_PATH < queries/providers/aws.sql

# Load azure data
duckdb $DATA_PATH < queries/providers/azure.sql

# Load cloudflare data
duckdb $DATA_PATH < queries/providers/cloudflare.sql

# Load digitalocean data
duckdb $DATA_PATH < queries/providers/digitalocean.sql

# Load fastly data
duckdb $DATA_PATH < queries/providers/fastly.sql

# Load googlecloud data
duckdb $DATA_PATH < queries/providers/googlecloud.sql

# Load oracle data
duckdb $DATA_PATH < queries/providers/oracle.sql

# Create view
duckdb $DATA_PATH < queries/create_view.sql
