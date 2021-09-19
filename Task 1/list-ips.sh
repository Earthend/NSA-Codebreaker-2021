#! /bin/bash
# Must be ran within the directory since I didn't set up the directory reference

# Gather the IPs from the packet into a list
ips=$(tshark -r ./capture.pcap  -T fields -e ip.dst ip.src | sort | uniq | tr '\n' ' ')

# Run remaining code if we successfully ran the previous content
if [ $? -eq 0 ]; then
# Create or reset the results file to copy content to
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
fi