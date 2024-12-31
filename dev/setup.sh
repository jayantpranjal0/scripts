#!/bin/bash

# Check if the OS type is Debian
if [ -f /etc/debian_version ]; then
    echo "Debian-based system detected. Running apt update and upgrade..."
    sudo apt update && sudo apt upgrade -y
else
    echo "This script is only for Debian-based systems."
fi

# Run the script in ../git/setup.sh
if [ -f ../git/setup.sh ]; then
    echo "Running the setup script from ../git/setup.sh..."
    bash ../git/setup.sh
else
    echo "The setup script ../git/setup.sh does not exist."
fi