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
rm -rf "$PWD/home"

# Copy the sudoers file using cat. This is explicitly allowed without password
# through a line in the sudoers file.
mkdir -p "$PWD/etc"
sudo cat /etc/sudoers > "$PWD/etc/sudoers"

# Copy the Portage configuration.
mkdir -p "$PWD/etc/portage"
mkdir -p "$PWD/etc/portage/repos.conf"
cp /etc/portage/{make.conf,package.{accept_keywords,mask,use}} "$PWD/etc/portage"
cp /etc/portage/repos.conf/rightfold-overlay.conf "$PWD/etc/portage/repos.conf"

# Copy the X configuration.
mkdir -p "$PWD/home/r"
cp /home/r/.xinitrc "$PWD/home/r"
