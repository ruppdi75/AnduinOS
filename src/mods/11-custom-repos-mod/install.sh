#!/bin/bash

# Exit on error
set -e
set -o pipefail
set -u

print_ok "Adding custom APT repositories for LumiOS..."

# --- Microsoft Edge ---
print_info "Adding Microsoft Edge repository..."
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/microsoft-edge.gpg
judge "Downloaded Microsoft Edge GPG key."
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main' > /etc/apt/sources.list.d/microsoft-edge.list
judge "Added Microsoft Edge repository source."

# --- OnlyOffice ---
print_info "Adding OnlyOffice repository..."
mkdir -p -m 755 /usr/share/keyrings
curl -sSL https://download.onlyoffice.com/GPG-KEY-ONLYOFFICE | gpg --dearmor > /usr/share/keyrings/onlyoffice.gpg
judge "Downloaded OnlyOffice GPG key."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main" > /etc/apt/sources.list.d/onlyoffice.list
judge "Added OnlyOffice repository source."

# Update package list
print_info "Updating APT package lists..."
apt-get update
judge "Successfully updated package lists."

print_ok "Custom APT repositories added successfully."
