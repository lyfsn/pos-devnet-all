#!/bin/bash

if [ ! -f pid.file ]; then
    echo "No pid.file found. Process might not be running."
    exit 1
fi

PID=$(cat pid.file)

if ps -p $PID > /dev/null; then
   echo "Process with PID $PID is running."
else
   echo "Process with PID $PID is not running. Consider removing pid.file."
fi
