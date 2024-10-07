#!/bin/bash

# Variables
CLI_CONTAINER_NAME="cli"
DB_NAME="database"
DB_USER="user"
DB_PASS="password"
DB_HOST="mariadb"

# Step 1: Get SITENAME from user input
if [ -z "$1" ]; then
    echo "Usage: $0 <SITENAME>"
    exit 1
fi
SITENAME=$1

# Step 2: Bring the containers up.
SITENAME=$SITENAME docker-compose -p $SITENAME up -d

# Wait a few seconds for the containers to initialize.
sleep 5

# Step 3: SSH into the CLI container and run WordPress setup commands
docker exec -it --user root $SITENAME-$CLI_CONTAINER_NAME sh -c "wp core download --allow-root && wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$SITENAME_$DB_HOST --allow-root"

echo "Site setup complete."