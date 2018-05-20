#!/bin/bash

set -e

# This script updates the workstation configuration repository using the
# current workstation configuration.

# Check that we do not accidentally overwrite anything important.
if [ "$PWD" != '/home/r/ricing' ]; then
	echo 'This script must be run from the repository root!' >> /dev/stderr
	exit 1
fi

# Clean up the repository before repopulating it.
rm -rf "$PWD/etc"
rm -rf "$PWD/home"
rm -rf "$PWD/var"

# Copy the sudoers file using cat. This is explicitly allowed without password
# through a line in the sudoers file.
mkdir -p "$PWD/etc"
sudo cat /etc/sudoers > "$PWD/etc/sudoers"

# Copy the Portage configuration.
mkdir -p "$PWD/etc/portage"
mkdir -p "$PWD/etc/portage/repos.conf"
mkdir -p "$PWD/var/lib/portage"
cp /etc/portage/{make.conf,package.{accept_keywords,mask,use}} "$PWD/etc/portage"
cp /etc/portage/repos.conf/rightfold-overlay.conf "$PWD/etc/portage/repos.conf"
cp /var/lib/portage/world "$PWD/var/lib/portage"

# Copy the X configuration.
mkdir -p "$PWD/home/r"
cp /home/r/.xinitrc "$PWD/home/r"

# Copy the i3 configuration.
mkdir -p "$PWD/home/r/.config/i3"
mkdir -p "$PWD/home/r/.config/i3status"
cp /home/r/.config/i3/config "$PWD/home/r/.config/i3"
cp /home/r/.config/i3status/config "$PWD/home/r/.config/i3status"

# Copy the Nginx configuration.
mkdir -p "$PWD/etc/nginx"
cp /etc/nginx/nginx.conf "$PWD/etc/nginx"

# Copy the GTK+ configuration.
mkdir -p "$PWD/home/r/.config/gtk-3.0"
cp /home/r/.config/gtk-3.0/settings.ini "$PWD/home/r/.config/gtk-3.0"

# Copy the Z shell customization.
mkdir -p "$PWD/home/r/.oh-my-zsh"
cp -R /home/r/.oh-my-zsh/custom "$PWD/home/r/.oh-my-zsh"

# Copy the Midnight Commander configuration.
mkdir -p "$PWD/home/r/.config/mc"
cp /home/r/.config/mc/ini "$PWD/home/r/.config/mc"
cp /home/r/.config/mc/panels.ini "$PWD/home/r/.config/mc"

# Copy the sshd configuration.
mkdir -p "$PWD/etc/ssh"
sudo cat /etc/ssh/sshd_config > "$PWD/etc/ssh/sshd_config"
