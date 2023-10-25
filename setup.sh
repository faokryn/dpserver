#!/bin/bash

# First of all, we need to install the basic dependencies.
# This is distro specific.
source /etc/os-release
for distro in $ID $ID_LIKE NONE; do
	if [ -f ./setup.$distro.sh ]; then echo "Trying setup.$distro.sh" && bash ./setup.$distro.sh && break; fi
	if [ "$distro" == "NONE" ]; then echo "There is no setup script for $ID :(" >&2; exit 1; fi
done


mkdir -p session-templates

if [[ ! -d webadmin ]]
then
	./update-webadmin.sh
fi

if [[ ! -f nginx-config/htpasswd ]]
then
	./set-webadmin-password.sh
fi

if [[ ! -f .env ]]
then
	./configure.sh
fi

clear
echo "Setup complete. Refer to README.md for extra changes you might want to make."
echo "To start the server, run: docker-compose up -d"

