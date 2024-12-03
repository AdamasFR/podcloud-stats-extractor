#!/bin/bash

source config.sh
echo $CSRF_TOKEN

# Define constants
BASE_DIR="data"
API_BASE_URL="https://studio.podcloud.fr/podcasts"

# Create base directory
rm -rf "$BASE_DIR"
mkdir -p "$BASE_DIR"

# Fetch data for each podcast
for PODCAST in "${PODCASTS[@]}"; do
    PODCAST_DIR="$BASE_DIR/$PODCAST"
    OUTPUT_FILE_DOWNLOAD="$PODCAST_DIR/downloads.json"
    API_URL_DOWNLOAD="$API_BASE_URL/$PODCAST/stats/projection/timeseries/downloads/monthly"

    # Create directory for podcast
    mkdir -p "$PODCAST_DIR"

    # Fetch data
    curl "$API_URL_DOWNLOAD" \
        --compressed \
        -H "Accept: application/json, text/javascript, */*; q=0.01" \
        -H "Accept-Language: fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3" \
        -H "Referer: $API_BASE_URL/$PODCAST/stats" \
        -H "X-CSRF-Token: $CSRF_TOKEN" \
        -H "X-Requested-With: XMLHttpRequest" \
        -H "Connection: keep-alive" \
        -H "Cookie: $COOKIE" \
        -o "$OUTPUT_FILE_DOWNLOAD"

    echo "Data fetched for podcast '$PODCAST' and saved to '$OUTPUT_FILE_DOWNLOAD'"
done

echo "All data fetched successfully."
