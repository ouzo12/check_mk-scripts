# check_snds.sh 

This script is made to run locally on the check_mk server.
It will only scan the ip it connect to from check_mk for snds blocks, ipv6 are not supported by snds at the moment,
and will not be shown.

Every server running this script will download newest ipstatus from snds every 12 hours (720min).


Require:
- bc command to run.
- ip adresses added to your snds account

## Install info (based on omdistro.org installation)

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

Link the sh fil to your nagios plugins dir

Example:
	ln -s check_snds.sh /omd/sites/nagios22/local/lib/nagios/plugins/check_snds.sh

Jump into you check_mk / WATO / Host & Service Parameters / Active checks (HTTP, TCP, etc.) / Classical active and passive Monitoring checks

Create a new rule
Service description : SNDS Check
Command line : $USER2$/check_snds.sh $HOSTADDRESS$


Then do a Bulk Discovery. And your check_mk should start to warn you if servers are snds blocked. But only for the ip's in your snds account. So make sure you have added all your ip's into it.

This check will only check the ip check_mk has added to the server.
