#!/bin/bash

# /etc/network/interfaces
# for PXE boot off the ethernet interface
auto eth0
iface eth0 inet static
        address 192.168.20.222
        netmask 255.255.255.0


# Configure rpi to forward traffic from eth0 to wlan0
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
sudo iptables -A FORWARD -i wlan0 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i eth0 -o wlan0 -j ACCEPT

# TODO: add dhcp server with options for PXE boot
