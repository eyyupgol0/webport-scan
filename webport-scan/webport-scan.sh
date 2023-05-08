#! /bin/bash

read=$1

curl -Ls $1 | grep -i "$1" | cut -d ":" -f 2 | cut -d "/" -f 3 | cut -d '"' -f 3 | cut -d "'" -f 1  | grep "$1" | grep -v eg | cut -d "." -f 1,2,3 | sort | uniq > domainlist


filename="domainlist"

while read -r mac; 
do
 ip=$(ping -c 1 $mac | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" )
	nmap $ip -p 1-1000 &
done  < "$filename"

wait

echo

echo "nayss :) "
