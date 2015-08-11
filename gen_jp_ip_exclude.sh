#!/usr/bin/env bash

# Generate ignore.list for shadowsocks where IP address that excepts Japan IPv4
wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | awk -F\| '$0 !~ /(JP\|ipv4)|(ipv6)|(asn)|(summary)|(\+1000)|(^\#)/ {printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > JP_exclude.list
