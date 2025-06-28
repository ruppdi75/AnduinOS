#!/bin/bash
set -e
set -o pipefail
set -u

print_ok "Applying graphics compatibility fixes..."

GDM_CONFIG="/etc/gdm3/custom.conf"

if [ -f "$GDM_CONFIG" ]; then
    print_info "Disabling Wayland in GDM configuration to force Xorg for better compatibility..."
    # Check if the line is already uncommented
    if grep -q "^#WaylandEnable=false" "$GDM_CONFIG"; then
        sed -i 's/^#\(WaylandEnable=false\)/\1/' "$GDM_CONFIG"
        judge "Wayland disabled in GDM."
    else
        print_info "WaylandEnable setting already configured or not found in default state. Assuming it's handled."
    fi
else
    print_warn "GDM custom.conf not found. Skipping Wayland fix."
fi

print_ok "Graphics compatibility fixes applied."
