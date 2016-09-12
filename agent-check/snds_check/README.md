# snds_check.sh 

This script is made to run locally on each agent server.
It will find the local ip's and scan them all for snds block, ipv6 are not supported by snds at the moment,
and will not be shown.

Every server running this script will download newest ipstatus from snds every 12 hours (720min).

Require:
- bc command to run.
- ip adresses added to your snds account

## Install info

signup at microsoft snds at or just login
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

You should now have a service on the server called SNDS-Local
