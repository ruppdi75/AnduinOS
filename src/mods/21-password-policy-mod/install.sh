#!/bin/bash
set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error

print_ok "Configuring password quality policy..."

# Reinstall password quality tools and add German dictionary to enforce stronger passwords
if ! apt-get install -y --reinstall libpam-pwquality cracklib-runtime wngerman; then
    print_error "Failed to install password policy packages."
    exit 1
fi

judge "Password policy configured"
