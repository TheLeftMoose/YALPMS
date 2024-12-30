#!/bin/bash

# Array to store detected package managers
DETECTED_PACKAGE_MANAGERS=()

# Function to detect package managers
detect_package_managers() {
    if command -v apt &> /dev/null; then
        DETECTED_PACKAGE_MANAGERS+=("apt")
    fi
    if command -v snap &> /dev/null; then
        DETECTED_PACKAGE_MANAGERS+=("snap")
    fi
    if command -v flatpak &> /dev/null; then
        DETECTED_PACKAGE_MANAGERS+=("flatpak")
    fi
}

# Export the function for use in other scripts
export -f detect_package_managers