#senderbase

Checks server ip on senderbase.org

## install
Link the sh fil to your nagios plugins dir

Example:
 ln -s senderbase.sh /omd/sites/nagios22/local/lib/nagios/plugins/senderbase.sh

Jump into you check_mk / WATO / Host & Service Parameters / Active checks (HTTP, TCP, etc.) / Classical active and passive Monitoring checks

Create a new rule
Service description : Senderbase
Command line : $USER2$/senderbase.sh $HOSTADDRESS$
