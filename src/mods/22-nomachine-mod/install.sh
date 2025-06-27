#!/bin/bash
set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error

print_ok "Installing NoMachine..."

# Define NoMachine download URL and package name
NOMACHINE_URL="https://download.nomachine.com/download/9.0/Linux/nomachine_9.0.188_11_amd64.deb"
NOMACHINE_DEB="/tmp/nomachine.deb"

# Download the package
print_info "Downloading NoMachine from $NOMACHINE_URL..."
if ! curl -L -o "$NOMACHINE_DEB" "$NOMACHINE_URL"; then
    print_error "Failed to download NoMachine."
    exit 1
fi

# Install the package
print_info "Installing NoMachine package..."
if ! apt-get install -y "$NOMACHINE_DEB"; then
    print_error "Failed to install NoMachine."
    exit 1
fi

# Clean up the downloaded file
rm -f "$NOMACHINE_DEB"

judge "NoMachine installed successfully"
