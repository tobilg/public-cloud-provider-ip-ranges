#!/bin/bash

# Store in /tmp
cd /tmp

# Download DuckDB
wget https://github.com/duckdb/duckdb/releases/download/v1.1.3/duckdb_cli-linux-amd64.zip -O /tmp/duckdb_cli-linux-amd64.zip

# Unzip to /usr/local/bin
sudo unzip -d /usr/local/bin /tmp/duckdb_cli-linux-amd64.zip

# Delete downlaod
rm /tmp/duckdb_cli-linux-amd64.zip
