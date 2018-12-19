#! /bin/bash

WLAN="wlan0"
WEB="wlan1"

while getopts "h" opt; do
	case $opt in
		h)
			cat manual
			exit
			;;
	esac
done

echo "Wifi network hosted on: $WLAN" 

# resolve wifi conflicts
gnome-terminal -e "bash -c \"airmon-ng check kill; exec bash\"" &> /dev/null
kill $(ps aux | grep 'airmon-ng' | awk '{print $2}') &> /dev/null

echo "Starting up wifi network" 
gnome-terminal -e "bash -c \"airbase-ng -e "practice" -c 1 $WLAN; exec bash\"" &> /dev/null
sleep 2

# set up dhcp
ifconfig at0 10.0.0.1/24 up
sleep 5
gnome-terminal -e "bash -c \"dnsmasq -C ./dnsmasq.conf -d; exec bash\"" &> /dev/null

# set up ip forwarding
ifconfig $WEB 10.0.0.2/24 up
iptables --flush
# iptables --table nat --append POSTROUTING --out-interface $WEB -j MASQUERADE
# iptables --append FORWARD --in-interface at0 -j ACCEPT

# start up apache
sleep 5
/etc/init.d/apache2 start
