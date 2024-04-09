#!/bin/bash

# Fetch METAR data from the URL
metar_data=$(curl -s "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=false&hours=12&bbox=40%2C-90%2C45%2C-85")

# Check if metar_data is empty or null
if [ -z "$metar_data" ] || [ "$metar_data" == "null" ]; then
    echo "Failed to fetch METAR data or no data available."
    exit 1
fi

# Parse the data and extract receiptTime values
receipt_times=$(echo "$metar_data" | jq -r '.[].receiptTime')

# Check if receipt_times is empty or null
if [ -z "$receipt_times" ] || [ "$receipt_times" == "null" ]; then
    echo "Failed to parse receiptTime values or no data available."
    exit 1
fi

# Output the first six values
echo "$receipt_times" | head -n 6