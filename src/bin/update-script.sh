#!/bin/bash

#
# This script updates the detected package managers on the system.
#
# Functions:
# - update_package_managers(exec_flag, update_only_flag): Updates the package managers based on the flags provided.
#   - exec_flag: A flag to indicate if the script should execute the updates.
#   - update_only_flag: A flag to indicate if only updates (and not upgrades) should be performed.
#
# Supported Package Managers:
# - apt: Uses 'sudo apt update' for updating and 'sudo apt upgrade -y' for upgrading.
# - snap: Uses 'sudo snap refresh --list' for listing updates and 'sudo snap refresh' for applying updates.
# - flatpak: Uses 'flatpak update --appstream' for updating appstream data and 'flatpak update -y' for applying updates.
#
# Input Arguments:
# - --exec: Sets the EXEC flag to true, indicating that the script should execute the updates.
# - --update-only: Sets the UPDATE_ONLY flag to true, indicating that only updates should be performed without upgrades.
#
# The script first parses the input arguments to set the appropriate flags.
# It then detects the package managers available on the system.
# Finally, it calls the update_package_managers function with the parsed flags to perform the updates.

# Detect available package managers
source ../helpers/detect_pm.sh

# Function to update package managers
update_package_managers() {
    local exec_flag=$1
    local update_only_flag=$2

    for pm in "${DETECTED_PACKAGE_MANAGERS[@]}"; do
        echo "----------------------------------------"
        echo "Now starting package manager: $pm"
        echo "----------------------------------------"
        case $pm in
            apt)
                if [ "$update_only_flag" = true ]; then
                    sudo apt update
                else
                    sudo apt update && sudo apt upgrade -y
                fi
                ;;
            snap)
                if [ "$update_only_flag" = true ]; then
                    sudo snap refresh --list
                else
                    sudo snap refresh
                fi
                ;;
            flatpak)
                if [ "$update_only_flag" = true ]; then
                    flatpak update --appstream
                else
                    flatpak update -y
                fi
                ;;
            *)
                echo "Unsupported package manager: $pm"
                ;;
        esac
    done
}

# Parse input arguments
EXEC=false
UPDATE_ONLY=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --exec) EXEC=true ;;
        --update-only) UPDATE_ONLY=true ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Detect package managers
detect_package_managers

# Output detected package managers
echo "Detected package managers: ${DETECTED_PACKAGE_MANAGERS[@]}"

# Update package managers
update_package_managers $EXEC $UPDATE_ONLY