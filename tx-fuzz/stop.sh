#!/bin/bash

if [ ! -f pid.file ]; then
    echo "Error: pid.file not found. Maybe the process is not running or you are in the wrong directory."
    exit 1
fi

PID=$(cat pid.file)

if [ "$1" == "-9" ]; then
    kill -9 $PID
else
    kill $PID
fi

if [ $? -eq 0 ]; then
    rm pid.file
    echo "Process $PID stopped successfully."
else
    echo "Failed to stop process $PID."
fi
