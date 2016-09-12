#!/bin/bash

neutral="0.5"
poor="-1.0"

if [ "$1" = "" ]; then
	echo "Usage: $0 <ip>"
	echo "Neutral is $neutral - Poor is $poor - Everything better that neutral is GOOD!"
	exit 2
fi

reverseip=`echo -n ${1}. | tac -s'.'`
senderbasetest=`dig -t txt +short $reverseip\rf.senderbase.org`
senderbase=`echo $senderbasetest| sed 's/"//g'`

if [ "$senderbasetest" = "" ]; then
	echo "OK - No result found"
	exit 0
 else
	if [ `echo "$senderbase > $neutral" | bc -l` = 1 ]; then
		echo "REPUTATION STATUS: GOOD ($senderbase)"
		exit 0
	fi
	if [ `echo "$senderbase > $poor" | bc -l` = 1 ]; then
		echo "REPUTATION STATUS: NEUTRAL ($senderbase)"
		exit 1
	else
		echo "REPUTATION STATUS: POOR ($senderbase)"
		exit 2
	fi
fi
