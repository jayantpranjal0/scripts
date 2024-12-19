#!/bin/bash

# Check if the OS type is Debian
if [ -f /etc/debian_version ]; then
    echo "Debian-based system detected. Running apt update and upgrade..."
    sudo apt update && sudo apt upgrade -y
else
    echo "This script is only for Debian-based systems."
fi