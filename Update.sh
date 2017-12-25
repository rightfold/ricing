#!/bin/bash

set -e

# This script updates the workstation configuration repository using the
# current workstation configuration.

# Check that we do not accidentally overwrite anything important.
if [ "$PWD" != '/home/r/workstation-configuration' ]; then
	echo 'This script must be run from the repository root!' >> /dev/stderr
	exit 1
fi

# Clean up the repository before repopulating it.
rm -rf "$PWD/etc"

# Copy the sudoers file using cat. This is explicitly allowed without password
# through a line in the sudoers file.
mkdir -p "$PWD/etc"
sudo cat /etc/sudoers > "$PWD/etc/sudoers"
