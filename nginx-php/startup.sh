#!/usr/bin/env bash

# Adding host machine hostname
echo -e "\n# Hostname for gateway" >> /etc/hosts
echo -e "`/sbin/ip route|awk '/default/ { print $3 }'`\tdocker.host.internal\n" >> /etc/hosts

/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf