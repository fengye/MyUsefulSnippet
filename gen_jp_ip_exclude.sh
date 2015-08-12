#!/usr/bin/env bash

# Generate ignore.list for shadowsocks where IP address that excepts Japan IPv4
wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | awk -F\| '$0 !~ /(JP\|ipv4)|(ipv6)|(asn)|(summary)|([\+-][0-9]+)|(^\#)/ {printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > JP_exclude.list
wget -O- 'http://ftp.apnic.net/pub/stats/arin/delegated-arin-extended-20150811' | awk -F\| '$0 !~ /(JP\|ipv4)|(ipv6)|(asn)|(summary)|([\+-][0-9]+)|(^\#)/ {printf("%s/%d\n", $4, 32-log($5)/log(2)) }' >> JP_exclude.list
wget -O- 'http://ftp.apnic.net/pub/stats/ripe-ncc/delegated-ripencc-extended-latest' | awk -F\| '$0 !~ /(JP\|ipv4)|(ipv6)|(asn)|(summary)|([\+-][0-9]+)|(^\#)/ {printf("%s/%d\n", $4, 32-log($5)/log(2)) }' >> JP_exclude.list
