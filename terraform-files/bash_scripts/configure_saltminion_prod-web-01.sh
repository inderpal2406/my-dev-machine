#!/usr/bin/env bash

# This script will setup hostname, make entry of Saltmaster IP address in /etc/hosts file and install salt minion.
# This script will seamlessly work on Ubuntu 20.04 LTS. It is not tested on other platforms.
# Salt minion installation is a bootstrap method which identifies the platform and does the installation by itself.
# Some of the content of this script is taken from https://repo.saltproject.io/#bootstrap
# Author: Inderpal Singh
# Date: 13 September, 2021

# Script starts here.

# Set hostname.

machine_name="prod-web-01"
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
	# Install salt minion as the SHA256 message digest matches.
	sudo sh install_salt.sh -P -x python3 -A saltmaster -i $machine_name
	echo "Salt version: $(salt-minion --version)"
else
	# If hash check fails, then don't install salt and exit.
	echo "WARNING! this file is corrupt or has been tampered with! Exiting script without installation!!!"
	exit 1
fi

# Change back to home directory of user.

cd


