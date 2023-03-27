#!/bin/bash

# Select the crontab file based on the environment
CRON_FILE="crontab.fedifetcher"

# Load the crontab file
echo "Loading crontab file: ${CRON_FILE}"
crontab ${CRON_FILE}

# Start cron
echo "Starting cron..."
crond -f
