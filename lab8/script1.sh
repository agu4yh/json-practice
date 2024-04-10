#!/bin/bash

# Fetch the KMCI METAR data from the URL
metar_data=$(curl -s "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=false&hours=12&bbox=40%2C-90%2C45%2C-85")

# Parse the data and pull out the receiptTime values
receipt_times=$(echo "$metar_data" | jq -r '.[].receiptTime')

# Output the first six values
echo "$receipt_times" | head -n 6