#!/bin/sh

# Just a quick little script to run the install and the remaining nodes

while read host

do
	echo "Launching install for $host pid's to follow..."
	./installAgents.sh $host &

done < hostsList.txt
