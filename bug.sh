#!/bin/bash

# This script attempts to process a file, but it has a subtle race condition.
# If the file is being written to concurrently, the script might fail to process it correctly.

file_to_process="/tmp/data.txt"

# Attempt to process file
while true; do
  if [ -f "$file_to_process" ]; then
    echo "Processing file: $file_to_process"
    #Simulate processing. Replace with your code
    sleep 1
    #Check if the file changed during processing.  This is simplistic and might not catch all race conditions
    if [ "$(md5sum $file_to_process | awk '{print $1}')" != "$(md5sum <(cat $file_to_process) | awk '{print $1}')" ]; then 
        echo "Error: File changed during processing"
        exit 1
    fi
    break
  fi
  sleep 1
  echo "Waiting for file: $file_to_process"
done

#Process the file data (replace with actual processing logic)
echo "File processed successfully."