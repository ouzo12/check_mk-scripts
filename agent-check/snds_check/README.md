# snds_check.sh 

This script is made to run locally on each agent server.
It will find the local ip's and scan them all for snds block.

Every server running this script will download newest ipstatus from snds every 4 hours.

- require - bc command to run.


## Install info

signup at microsoft snds at
https://postmaster.live.com/snds/
------
Edit Profile
Automated access: View or change your automated access settings
Enable Automated Access

Copy the key from the ipStatus link (only copy whats after key=)
https://postmaster.live.com/snds/ipStatus.aspx?key=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
------

Insert the key into the script
sndskey="xxxxxxxx...."

copy the script to check_mk dir

	mkdir -p /usr/lib/check_mk_agent/local/7200/
	cp snds_check.sh /usr/lib/check_mk_agent/local/7200/

Then update servers services in check_mk
