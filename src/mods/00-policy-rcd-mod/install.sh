#!/bin/bash

#==========================
# Set up the environment
#==========================
set -e
set -o pipefail
set -u
source /root/mods/shared.sh

#======================================================================================
# Create a policy-rc.d script to prevent services from starting during package installation
# in a chroot environment. This avoids dpkg errors when packages try to use systemctl.
#======================================================================================
print_ok "Creating a chroot-friendly policy-rc.d to prevent services from starting..."

cat <<EOF > /usr/sbin/policy-rc.d
#!/bin/sh
#
# For use in a chroot environment.
#
# This script is called by package maintainer scripts (e.g., postinst)
# when they want to start, stop, or restart services. By exiting with
# status 101, we are telling the init system that the action is forbidden,
# thus preventing services from being started automatically during installation.
#

exit 101
EOF

chmod +x /usr/sbin/policy-rc.d

judge "Create policy-rc.d script"
