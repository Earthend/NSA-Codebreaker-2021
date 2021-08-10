#! /bin/bash

# Gather the IPs from the packet into a list
ips=$(tshark -r capture.pcap  -T fields -e ip.dst | sort | uniq | tr '\n' ' ')

if [ -e 'results.txt' ]; then
	truncate -s 0 results.txt
else
	touch 'results.txt'
fi

# For each IP in the list, check if they are in one of the ranges
for IP in $ips; do
	grepcidr -f ip_ranges.txt <(echo "$IP") >/dev/null && \
		echo "$IP is in range" && echo "$IP" >> results.txt
done
