#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Usage: ./start.sh <your_command> [args...]"
    exit 1
fi

nohup "$@" > nohup.out 2>&1 &

echo $! > pid.file

echo "Command started with PID $!"
