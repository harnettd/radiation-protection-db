#!/usr/bin/env bash

# --------------------------------------------------------------------------
# Project : A Relational Database for Radiation Protection in Uranium Mining
# Created : 2026-02-24
# Author  : Derek Harnett
# Version : 0.1.0
# --------------------------------------------------------------------------

set -euo pipefail

# Config
SQL_CMD=/opt/lampp/bin/mysql
USER="${MYSQL_USER:-root}"
# PASSWORD="${MYSQL_PASSWORD:-}"
SQL_DIR=./sql
DB_NAME=radiation_protection

# MySQL wrapper
run_sql() {
    echo Running $1
    # "${SQL_CMD}" -u "${USER}" -p "${PASSWORD}" "${DB_NAME}" < "${SQL_DIR}"/"$1"
    "${SQL_CMD}" -u "${USER}" "${DB_NAME}" < "${SQL_DIR}"/"$1"
}

# TODO: Check if mysql server is running

# Create database
echo Creating database ${DB_NAME}
"${SQL_CMD}" -u "${USER}" -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"

# Create tables
run_sql create-tables.sql

# Insert sample data into tables
run_sql insert-into-tables.sql

# Create views
run_sql create-views.sql

echo Setup complete