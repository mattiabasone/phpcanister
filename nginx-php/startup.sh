#!/usr/bin/env bash

# Adding host machine hostname
sudo bash -c 'echo -e "\n# Hostname for gateway" >> /etc/hosts'
sudo bash -c "echo -e \"`/sbin/ip route|awk '/default/ { print $3 }'`\tdocker.host.internal\n\" >> /etc/hosts"

TMP_PHP_XDEBUG_IDE_KEY=${PHP_XDEBUG_IDE_KEY}
for tmp_php_version in 7.1 7.2 7.3 7.4;
    do
        sudo bash -c "sed -i -r \"s|xdebug.idekey=([a-zA-Z0-9_]+)|xdebug.idekey=${TMP_PHP_XDEBUG_IDE_KEY}|g\" /etc/php/${tmp_php_version}/fpm/conf.d/20-xdebug.ini"
done

sudo /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf