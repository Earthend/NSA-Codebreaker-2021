#! /bin/bash
# requires package jq

# Records the 'LogonId' of everyone using the specified IP who logged on before the communication
ids=$(grep '192\.168\.90\.144' logins.json  | grep "Successful logon" | sed '1s/^/[/;$!s/$/,/;$s/$/]/' | \
jq '.[] | select(.TimeCreated<"2021-03-16T12:03:53.0000000+00:00") | .PayloadData3')


# Records the 'LogonId' of everyone who logged off after the communication
logouts=$(grep 'An account was logged off' logins.json | sed '1s/^/[/;$!s/$/,/;$s/$/]/' | \
jq '.[] | select(.TimeCreated>"2021-03-16T12:03:53.0000000+00:00") | .PayloadData3')

# Compare the two and now we have the login ID of the communicator!
grep -Fxf <(echo "$ids") <(echo "$logouts")