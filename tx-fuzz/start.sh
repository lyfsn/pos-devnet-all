#!/bin/bash

# Start sendTransaction.js with Node.js
nohup node sendTransaction.js > nohup.out 2>&1 &

# Save the PID of the process
echo $! > pid.file

# Inform the user about the started process
echo "sendTransaction.js started with PID $!"
