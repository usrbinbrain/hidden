#!/usr/bin/env bash
#
# Script Name   :h1dd3n.sh
# Description   :Put your Linux service behind an onion URL using tor package.
# Args          :Require a localhost port service as argument.
# Script repo   :https://github.com/usrbinbrain/hidden
# Author        :G.A.Gama (g8gama@pm.me)

# Function to create tor configuration.
hidding () {
	
	# Localhost port.
	lport="$1"
	[[ -z ${lport} ]] && echo -e "[-] Exec: $0 <your_localhost_service_port>" && exit

	# Set tor default user.
	user=$(awk -F':' '/lib\/tor/ {print$1}' /etc/passwd)
	
	sudo echo -e "# Hidden service for 127.0.0.1:${lport}.\nHiddenServiceDir /var/lib/tor/${lport}_service/\nHiddenServicePort ${lport} 127.0.0.1:${lport}\n\n" >> /etc/tor/torrc

	# Set configuration dir name.
	config_dir="/var/lib/tor/${lport}_service"

	# Check/Create config dir full path.
	[[ ! -d ${config_dir} ]] && sudo mkdir -p ${config_dir} >&-
	
	# Set service user permitions.
	sudo chown ${user}:${user} ${config_dir}
	sudo chmod 700 ${config_dir}

	# Stop any tor service to perform new share.
	sudo systemctl stop tor &&
	# Start tor service.
	sudo -u ${user} tor & disown

	# Wait tor generate onion URL.	
	sleep 5
	# Show onion URL information.
	onionway=$(<"${config_dir}"/hostname)
    	echo -e "\n\n[+] Service \e[1m127.0.0.1:${lport}\e[0m avaliable on: \e[1m${onionway}:${lport}\e[0m\n\n"
}

# Check tor and start execution script or show tor install message.
which tor &>/dev/null && hidding "$1" || echo "[-] Need install tor package (https://linux.die.net/man/1/tor)."
