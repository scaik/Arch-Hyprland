#!/bin/bash
# 💫 https://github.com/JaKooLit 💫 #
# Rust #
if [[ $USE_PRESET = [Yy] ]]; then
  source ./preset.sh
fi

## WARNING: DO NOT EDIT BEYOND THIS LINE IF YOU DON'T KNOW WHAT YOU ARE DOING! ##

# Determine the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || exit 1

source "$(dirname "$(readlink -f "$0")")/Global_functions.sh"

# Set the name of the log file to include the current date and time
LOG="Install-Logs/install-$(date +%d-%H%M%S)_rust.log"

# Rust
printf "${NOTE} Installing Rustup and Cargo binaries...\n"  

install_package_pacman "rustup" 2>&1 | tee -a "$LOG"
[ $? -ne 0 ] && { echo -e "\e[1A\e[K${ERROR} - rustup Package installation failed, Please check the installation logs"; exit 1; }

printf "\n%.0s" {1..2}

rustup default stable

cargo install cargo-update

clear
