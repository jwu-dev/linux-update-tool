#!/bin/bash

#=======================================================================
# Global Configuration
#=======================================================================
LOG_FILE="updater_script.log" # Define the log file name

# Initialize log file with a timestamp for this run
# Create the file if it doesn't exist, or append if it does.
# Using a block to ensure all echos go to the log if >> is used on the block.
# However, for tee, we need to do it line by line if we also want console output.
echo "==================================================" | tee -a "$LOG_FILE"
echo "Log for script run starting at: $(date)" | tee -a "$LOG_FILE"
echo "==================================================" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE" # Add an initial blank line for readability

#=======================================================================
# Function Definitions
#=======================================================================

# Function to handle Arch Linux updates
update_arch_linux() {
  echo "--- Arch Linux Update ---" | tee -a "$LOG_FILE"
  echo "Checking for Arch Linux updates..." | tee -a "$LOG_FILE"
  # sudo pacman -Syyu --print 2>&1 | tee -a "$LOG_FILE"
  echo "(Simulated: sudo pacman -Syyu --print would show a list of packages here)" 2>&1 | tee -a "$LOG_FILE"
  echo "-------------------------" | tee -a "$LOG_FILE"

  read -p "The list above shows pending updates. Proceed with actual upgrade? (y/n): " confirm
  echo "User confirmation for Arch: $confirm" >> "$LOG_FILE"

  if [ "$confirm" == "y" ]; then
    echo "Starting Arch Linux update process..." | tee -a "$LOG_FILE"
    # sudo pacman -Syu 2>&1 | tee -a "$LOG_FILE"
    echo "(Simulated: sudo pacman -Syu)" 2>&1 | tee -a "$LOG_FILE"
    simulated_exit_status=$((RANDOM % 2))
    if [ $simulated_exit_status -ne 0 ]; then
      (
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        echo "ERROR: The Arch Linux update command failed!"
        echo "Exit status was: $simulated_exit_status"
        echo "Please check any error messages above for details."
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      ) 2>&1 | tee -a "$LOG_FILE"
    else
      echo "Arch Linux update process simulated successfully." | tee -a "$LOG_FILE"
    fi
  else
    echo "Arch Linux update cancelled by user." | tee -a "$LOG_FILE"
  fi
  echo "-------------------------" | tee -a "$LOG_FILE"
  echo "" >> "$LOG_FILE"
}

# Function to handle Debian/Mint/Ubuntu based updates
update_debian_based() {
  echo "--- Debian/Mint/Ubuntu Based Update ---" | tee -a "$LOG_FILE"
  echo "Refreshing package lists..." | tee -a "$LOG_FILE"
  # sudo apt update 2>&1 | tee -a "$LOG_FILE"
  echo "(Simulated: sudo apt update)" 2>&1 | tee -a "$LOG_FILE"
  # Add error check for apt update here in a more robust script

  echo "Checking for upgradable packages..." | tee -a "$LOG_FILE"
  # apt list --upgradable 2>&1 | tee -a "$LOG_FILE"
  echo "(Simulated: apt list --upgradable would show packages here)" 2>&1 | tee -a "$LOG_FILE"
  echo "-------------------------------------" | tee -a "$LOG_FILE"

  read -p "The list above shows pending updates. Proceed with actual upgrade? (y/n): " confirm
  echo "User confirmation for Debian-based: $confirm" >> "$LOG_FILE"

  if [ "$confirm" == "y" ]; then
    echo "Starting Debian-based update process..." | tee -a "$LOG_FILE"
    # sudo apt upgrade -y 2>&1 | tee -a "$LOG_FILE"
    echo "(Simulated: sudo apt upgrade -y)" 2>&1 | tee -a "$LOG_FILE"
    simulated_exit_status=$((RANDOM % 2))
    if [ $simulated_exit_status -ne 0 ]; then
      (
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        echo "ERROR: The Debian-based upgrade command failed!"
        echo "Exit status was: $simulated_exit_status"
        echo "Please check any error messages above for details."
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      ) 2>&1 | tee -a "$LOG_FILE"
    else
      echo "Debian-based update process simulated successfully." | tee -a "$LOG_FILE"
    fi
  else
    echo "Debian-based update cancelled by user." | tee -a "$LOG_FILE"
  fi
  echo "-------------------------------------" | tee -a "$LOG_FILE"
  echo "" >> "$LOG_FILE"
}

# Function to handle Fedora updates
update_fedora_linux() {
  echo "--- Fedora Linux Update ---" | tee -a "$LOG_FILE"
  echo "Checking for Fedora updates..." | tee -a "$LOG_FILE"
  # sudo dnf check-update 2>&1 | tee -a "$LOG_FILE"
  echo "(Simulated: sudo dnf check-update would show packages here)" 2>&1 | tee -a "$LOG_FILE"
  echo "--------------------------" | tee -a "$LOG_FILE"

  read -p "The list above (if any) shows pending updates. Proceed with actual upgrade? (y/n): " confirm
  echo "User confirmation for Fedora: $confirm" >> "$LOG_FILE"

  if [ "$confirm" == "y" ]; then
    echo "Starting Fedora update process..." | tee -a "$LOG_FILE"
    # sudo dnf upgrade -y 2>&1 | tee -a "$LOG_FILE"
    echo "(Simulated: sudo dnf upgrade -y)" 2>&1 | tee -a "$LOG_FILE"
    simulated_exit_status=$((RANDOM % 2))
    if [ $simulated_exit_status -ne 0 ]; then
      (
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        echo "ERROR: The Fedora upgrade command failed!"
        echo "Exit status was: $simulated_exit_status"
        echo "Please check any error messages above for details."
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      ) 2>&1 | tee -a "$LOG_FILE"
    else
      echo "Fedora update process simulated successfully." | tee -a "$LOG_FILE"
    fi
  else
    echo "Fedora update cancelled by user." | tee -a "$LOG_FILE"
  fi
  echo "--------------------------" | tee -a "$LOG_FILE"
  echo "" >> "$LOG_FILE"
}

#=======================================================================
# Main Script Logic
#=======================================================================
echo "Starting Universal Linux Updater Script..." | tee -a "$LOG_FILE"
echo "Attempting to detect your Linux distribution..." | tee -a "$LOG_FILE"

if [ ! -f /etc/os-release ]; then
  echo "Error: /etc/os-release not found. Cannot determine OS." | tee -a "$LOG_FILE"
  exit 1
fi

source /etc/os-release

echo "Detected OS ID: $ID (Likes: $ID_LIKE)" | tee -a "$LOG_FILE"

if [ "$ID" == "arch" ]; then
  update_arch_linux
elif [ "$ID" == "linuxmint" ] || [[ "$ID_LIKE" == *"debian"* ]] || [[ "$ID_LIKE" == *"ubuntu"* ]]; then
  update_debian_based
elif [ "$ID" == "fedora" ]; then
  update_fedora_linux
else
  echo "Unsupported distribution: '$ID'. No update procedure defined for this OS." | tee -a "$LOG_FILE"
  exit 1
fi

echo "Thank you for using the Universal Linux Updater!" | tee -a "$LOG_FILE" # <-- NEW LINE
echo "Universal Linux Updater Script finished." | tee -a "$LOG_FILE"
echo "==================================================" >> "$LOG_FILE"
echo "Log for script run ended at: $(date)" >> "$LOG_FILE"
echo "==================================================" >> "$LOG_FILE"
echo "" >> "$LOG_FILE" # Extra blank line at the end of log section
