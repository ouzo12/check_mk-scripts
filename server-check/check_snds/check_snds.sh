#!/bin/bash

sndsfile=/tmp/snds.txt
iplist=/tmp/myiplist.txt
myhostip="$1"
sndskey="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

#Dont edit below
d2ip() {
 IFS=" " read -r a b c d  <<< $(echo  "obase=256 ; $1" |bc | sed 's/ 0/ /g')
 echo ${a#0}.${b#0}.${c#0}.${d#0}
}

ip2d() {
 IFS=.
 set -- $*
 echo $(( ($1*256**3) + ($2*256**2) + ($3*256) + ($4) ))
}

if [ ! "$1" = "" ]; then

if [ ! -f $sndsfile ]; then
 touch -d "200 hours ago" $sndsfile
fi

if [ ! -f $iplist ]; then
 touch -d "200 hours ago" $iplist
fi


if test "`find $sndsfile -mmin +720`"; then
  wget -q "https://postmaster.live.com/snds/ipStatus.aspx?key=$sndskey" -O $sndsfile
fi

if test "`find $iplist -mmin +720`"; then
 if [ -s $sndsfile ]; then
  rm -f $iplist
 fi
 myip=`cat $sndsfile | sed 's/,/ /g' | awk {' print $1"-"$2 '}`

 for MYIP in $myip; do
  ips=`echo ${MYIP%-*}`
  ipe=`echo ${MYIP#*-}`
  dec1=`ip2d $ips`
  dec2=`ip2d $ipe`

   for i in `eval echo {$dec1..$dec2}`; do
    d2ip $i >>$iplist
   done
 done
fi

counter=0
ipcount=""
for H in $myhostip; do
 myfinder=`grep $H $iplist`
 myfinder2=`grep "$H$" $iplist | wc -l`
  if [ ! "$myfinder2" = "0" ]; then
   ((counter++))
   ipcount="$ipcount $H"
  fi
done

if [ $counter -gt 0 ]; then
	echo "$ipcount Listed at Microsoft SNDS"
	exit 2
	 else
	echo "OK - Server ip - ($myhostip) are not listed at Microsoft SNDS"
	exit 0
fi
else
	echo "wrong paramters"
	exit 2
fi
