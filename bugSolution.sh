#!/bin/bash

# This script uses flock to prevent race conditions during file processing.

file_to_process="/tmp/data.txt"
lockfile="/tmp/data.txt.lock"

# Attempt to acquire the lock on the file
exec 10<>"$lockfile"

flock -n 10 || {
  echo "Error: File is currently being processed by another instance. Please try again later."
  exit 1
}

#Check if the file exists. If not, exit.
if [ ! -f "$file_to_process" ]; then 
  echo "Error: File not found"
  exit 1
fi

# Process the file
echo "Processing file: $file_to_process"
#Simulate processing. Replace with your code
sleep 1

# Release the lock
exe 10>&-

#Process the file data (replace with actual processing logic)
echo "File processed successfully."