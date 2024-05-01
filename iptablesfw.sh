#!/bin/bash

# Allow SSH and HTTP
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPU T -p tcp -j ACCEPT

# Allow loopback
iptables -I INPUT 1 -i lo -j ACCEPT

# Allow DNS
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --sport 53 -j ACCEPT
iptables -A INPUT  -p udp --sport 53 -j ACCEPT
iptables -A INPUT  -p udp --dport 53 -j ACCEPT

# Set default filter po li cy to DROP .
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
