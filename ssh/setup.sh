#!/bin/bash

# Detect the OS type
OS_TYPE=$(uname)

# Set up SSH key
if [ "$OS_TYPE" = "Linux" ] || [ "$OS_TYPE" = "Darwin" ]; then
    if [ -f ~/.ssh/id_ed25519 ]; then
        echo "SSH key already exists. Displaying the current public key:"
        cat ~/.ssh/id_ed25519.pub
        exit 0
    fi
    # Generate SSH key
    read -p "Enter your email: " email
    ssh-keygen -t ed25519 -C "$email"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
else
    echo "Unsupported OS type: $OS_TYPE"
    exit 1
fi

# Display the public key
echo "Your SSH public key is:"
cat ~/.ssh/id_ed25519.pub
