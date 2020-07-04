#!/usr/bin/env bash
###############################################
## Hidden service trought onion network.
###############################################

hdir() {
        echo -e "# Hidden service on local port "$1".\nHiddenServiceDir /var/lib/tor/"$1"_service/\nHiddenServicePort "$1" 127.0.0.1:"$1"\n\n" >> /etc/tor/torrc
        mkdir /var/lib/tor/"$1"_service > /dev/null
        chown debian-tor:debian-tor /var/lib/tor/"$1"_service/
}

whereis tor > /dev/null && torok="."

if [ "$torok" == "." ]; then
        if [ -z "$1" ]; then
                echo -e "USE: $0 <service_port>\n" && exit
        fi
        mtf=$1
        hdir $mtf
        systemctl stop tor &&
        chmod 700 /var/lib/tor/"$mtf"_service/ &&
        sudo -u debian-tor tor & disown
        sleep 5
        onionway=$(cat /var/lib/tor/"$mtf"_service/hostname)
        echo -e "\n\n[-] Service 127.0.0.1:$mtf avaliable on: $onionway:$mtf\n"
        unset torok
else
        echo "[-] Need install tor package !"
fi
