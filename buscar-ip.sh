#!/bin/bash
#
# Check for correct usage
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <user> <remote_host>"
    exit 1
fi

USER=$1
REMOTE_HOST=$2

# Check if SSH connection is available
if ! ssh "$USER@$REMOTE_HOST" true >/dev/null 2>&1; then
    echo "Error: Unable to connect to pi.local"
    exit 1
fi

# Get IPv4 address for wlan0 interface
IP_ADDRESS=$(ssh "$USER@$REMOTE_HOST" "ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'")

# Check if command was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to get IP address from pi.local"
    exit 1
fi

# Display the result
echo "$IP_ADDRESS"

