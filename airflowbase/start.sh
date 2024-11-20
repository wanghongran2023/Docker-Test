#!/bin/bash
set -e

# Initialize the Airflow database
airflow db init

# Create an admin user if it doesn't exist
if ! airflow users list | grep -q "admin"; then
    airflow users create \
        --username admin \
        --password admin \
        --firstname Admin \
        --lastname User \
        --role Admin \
        --email admin@example.com
fi

# Start the webserver and scheduler
airflow webserver &  # Run webserver in the background
airflow scheduler    # Run scheduler in the foreground

