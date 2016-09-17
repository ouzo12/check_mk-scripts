#!/bin/bash

neutral="69"
poor="60"

if [ "$1" = "" ]; then
	echo "Usage: $0 <ip>"
	echo "Neutral is $neutral - Poor is $poor - Everything better that neutral is GOOD!"
	exit 2
fi

reverseip=`echo -n ${1}. | tac -s'.'`
senderscoretest=`dig -t a +short $reverseip\score.senderscore.com`
senderscore=`echo ${senderscoretest##*.}`

if [ "$senderscoretest" = "" ]; then
	echo "SenderScore: No result found"
	exit 0
 else
	if [ `echo "$senderscore > $neutral" | bc -l` = 1 ]; then
		echo "SenderScore: $senderscore - Status: GOOD"
		exit 0
	fi
	if [ `echo "$senderscore > $poor" | bc -l` = 1 ]; then
		echo "SenderScore: $senderscore - Status: NEUTRAL - Could be better."
		exit 1
	else
		echo "SenderScore: $senderscore - Status: POOR - Info: https://www.senderscore.org/lookup.php?lookup=$1"
		exit 2
	fi
fi
