#!/usr/bin/env bash
########################################
# Hidden service trought onion network.
########################################

# Function to make configuration file of tor package.
hdir() {
        echo -e "# Hidden service on local port "$1".\nHiddenServiceDir /var/lib/tor/"$1"_service/\nHiddenServicePort "$1" 127.0.0.1:"$1"\n\n" >> /etc/tor/torrc
        mkdir /var/lib/tor/"$1"_service > /dev/null
        chown debian-tor:debian-tor /var/lib/tor/"$1"_service/
}
# Check tor package.
whereis tor > /dev/null && torok="."
# Get $torok status.  
if [ "$torok" == "." ]; then
        # Get first parameter status.
	if [ -z "$1" ]; then
                # Show information usage.
		echo -e "USE: $0 <service_port>\n" && exit
        fi
        mtf=$1
        hdir $mtf
        # Stop tor if runnning.
	systemctl stop tor &&
        # Assigning permissions.
	chmod 700 /var/lib/tor/"$mtf"_service/ &&
        # Launch tor as debian-tor user on background mode.
	sudo -u debian-tor tor & disown
        sleep 5
        # Get URL of service on tor network.
	onionway=$(cat /var/lib/tor/"$mtf"_service/hostname)
        # Show access information.
	echo -e "\n\n[-] Service 127.0.0.1:$mtf avaliable on: $onionway:$mtf\n"
        # Unset $torok.
	unset torok
else
        # Show this message if tor package does not exist.
	echo "[-] Need install tor package !"
fi
