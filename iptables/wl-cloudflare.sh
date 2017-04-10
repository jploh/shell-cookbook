#!/bin/sh

#
# Create an iptables chain to whitelist Cloudflare IP blocks or single hosts for port 80
# Source: https://www.cloudflare.com/ips/
#
# WARNING: Chain will be overwritten
#

CHAIN=wl-cloudflare

iptables -F $CHAIN
iptables -X $CHAIN
iptables -N $CHAIN
iptables -A $CHAIN -p tcp -s 103.21.244.0/22 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 103.22.200.0/22 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 103.31.4.0/22  --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 104.16.0.0/12 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 108.162.192.0/18 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 131.0.72.0/22 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 141.101.64.0/18 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 162.158.0.0/15 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 172.64.0.0/13 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 173.245.48.0/20 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 188.114.96.0/20 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 190.93.240.0/20 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 197.234.240.0/22 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 198.41.128.0/17 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -p tcp -s 199.27.128.0/21 --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A $CHAIN -j RETURN
