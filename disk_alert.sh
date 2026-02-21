#!/bin/bash
# while loop (script which checks and alerts if disk space > 90)

alert=90

df -h | awk 'NR>1 {print $5 " " $1}' | while read -r output; do
    echo "Disk detail: $output"

    usage=$(echo "$output" | awk '{print $1}' | cut -d '%' -f1)
    file_sys=$(echo "$output" | awk '{print $2}')

    if [[ "$usage" -ge "$alert" ]]; then
        echo "Critical for $file_sys"
    fi
done