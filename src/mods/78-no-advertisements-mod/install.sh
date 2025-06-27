set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error

print_ok "Ensuring Ubuntu Pro advertisement is disabled"
FILE="/etc/apt/apt.conf.d/20apt-esm-hook.conf"
if [[ -e "$FILE" ]]; then
  print_info "Found Ubuntu Pro advertisement hook file. Removing it..."
  rm -f "$FILE"
  print_ok "Successfully removed $FILE."
else
  print_ok "Ubuntu Pro advertisement hook file not found. No action needed."
fi
judge "Ensure Ubuntu Pro advertisement is disabled"