#!/bin/sh

#
# Create an iptables chain to whitelist Cloudflare IP blocks or single hosts for port 80
# Source: https://www.cloudflare.com/ips/
#
# WARNING: Chain will be overwritten
#

CHAIN=wl-cloudflare

iptables -F $CHAIN
iptables -D INPUT -j $CHAIN
iptables -X $CHAIN
iptables -N $CHAIN

CF_IPV4=`curl -s https://www.cloudflare.com/ips-v4`
for ip in $CF_IPV4;
do
  iptables -A $CHAIN -p tcp -s $ip --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
done

iptables -A $CHAIN -j RETURN
iptables -I INPUT 1 -j $CHAIN

# Now, again but for IPv6

ip6tables -F $CHAIN
ip6tables -D INPUT -j $CHAIN
ip6tables -X $CHAIN
ip6tables -N $CHAIN

CF_IPV6=`curl -s https://www.cloudflare.com/ips-v6`
for ip in $CF_IPV6;
do
  ip6tables -A $CHAIN -p tcp -s $ip --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
done

ip6tables -A $CHAIN -j RETURN
ip6tables -I INPUT 1 -j $CHAIN
