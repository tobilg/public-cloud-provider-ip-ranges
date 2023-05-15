#!/bin/bash

# Where to store the db file for DuckDB
DATA_PATH="/tmp/duckdb-database-$(date '+%F').duckdb"

# Run export script
duckdb $DATA_PATH < queries/export_provider_data.sql
