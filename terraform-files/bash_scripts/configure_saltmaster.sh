#!/usr/bin/env bash

# This script will setup hostname, install salt and make required salt directories on saltmaster server.
# This script will seamlessly work on Ubuntu 20.04 LTS. It is not tested on other platforms.
# Salt installation is a bootstrap method which identifies the platform and does the installation by itself.
# Some of the content of this script is taken from https://repo.saltproject.io/#bootstrap
# Author: Inderpal Singh
# Date: 3 September, 2021

# Script starts here.

# Set hostname.

machine_name="saltmaster"
sudo hostnamectl set-hostname "$machine_name"
echo "Hostname set to $machine_name."

# Make entry of saltmaster IP address in /etc/hosts file.

sudo echo "10.0.1.4 saltmaster" >> /etc/hosts
echo "Saltmaster IP address entry made in /etc/hosts file."

# Create directory to hold salt installation files and change directory.

install_files_dir="/tmp/salt_install_files"
mkdir -p "$install_files_dir"
cd "$install_files_dir"
echo "Created $install_files_dir directory to hold salt installation files."

# Download salt

curl -fsSL https://bootstrap.saltproject.io -o install_salt.sh
curl -fsSL https://bootstrap.saltproject.io/sha256 -o install_salt_sha256
echo "Downloaded salt install files."

# Verify file integrity

sha_of_file=$(sha256sum install_salt.sh | cut -d ' ' -f 1)
sha_for_validation=$(cat install_salt_sha256)
if [ "$sha_of_file" == "$sha_for_validation" ]
then
	# Install salt as the SHA256 message digest matches.
	sudo sh install_salt.sh -P -M -x python3
	echo "Salt version: $(salt --version)"
	sudo sh install_salt.sh -P -x python3 -A saltmaster -i $machine_name
else
	# If hash check fails, then don't install salt and exit.
	echo "WARNING! this file is corrupt or has been tampered with! Exiting script without installation!!!"
	exit 1
fi

# Create directories for salt

sudo mkdir -p /srv/salt/base
sudo mkdir -p /srv/pillar
echo "Directories needed by salt in /srv are created."

# Change back to home directory of user.

cd


