#!/usr/bin/env bash
# Hidden your localhost service thought onion network

hidding () {
	lport="$1"
	[[ -z "$lport" ]] && echo -e "[-] Exec: \e[1m $0 localhost_port\e[0m" && exit
	user=$(sudo grep '/var/lib/tor' /etc/passwd | cut -d : -f1)
	
	sudo echo -e "# Hidden service for 127.0.0.1:$lport.\nHiddenServiceDir /var/lib/tor/""$lport""_service/\nHiddenServicePort $lport 127.0.0.1:$lport\n\n" >> /etc/tor/torrc
	sudo mkdir -p /var/lib/tor/"$lport"_service > /dev/null
	sudo chown "$user":"$user" /var/lib/tor/"$lport"_service/
	sudo chmod 700 /var/lib/tor/"$lport"_service/
	sudo systemctl stop tor &&
	sudo -u "$user" tor & disown
	
	sleep 5
	onionway=$(sudo cat /var/lib/tor/"$lport"_service/hostname)
    	echo -e "\n\n[+] Service \e[1m127.0.0.1:$lport\e[0m avaliable on: \e[1m$onionway:$lport\e[0m\n\n"
}

which tor &>/dev/null && hidding "$1" || echo "[-] Need install tor package !"
