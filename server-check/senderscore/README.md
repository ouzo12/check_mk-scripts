#senderscore

Checks server ip on senderscore.com

## install
Link the sh file to your nagios plugins dir

Example:
 ln -s senderscore.sh /omd/sites/nagios22/local/lib/nagios/plugins/senderscore.sh

Jump into you check_mk / WATO / Host & Service Parameters / Active checks (HTTP, TCP, etc.) / Classical active and passive Monitoring checks

Create a new rule
Service description : Senderscore
Command line : $USER2$/senderscore.sh $HOSTADDRESS$
