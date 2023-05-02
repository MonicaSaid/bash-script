#!/bin/bash
####### This script is to monitor the system load 



##storing the values of the load average of the last 1min, 5mins and 15 mins
N1=$(uptime | cut -f 12 -d ' ' | sed 's/,//g')
N5=$(uptime | cut -f 13 -d ' ' | sed 's/,//g')
N15=$(uptime | cut -f 14 -d ' ' | sed 's/,//g')

#checking if the load is increasing, and if so storing it       
if [ $N1 > $N5 ] || [ $N1 > $N15 ]
        then
                echo -e "Load average:$(uptime)\nDate:$(date)\n" >> /var/log/systemLoad
                echo "subject: server 192.168.180.137 load" >> /tmp/events
                echo "Body:" >> /tmp/events
                echo "     Dear," >> /tmp/events
                echo "          The system $(hostname) runs with IP 192.168.180.137 has a load of " >> /tmp/events
                echo "          1 min load: ${N1}"  >> /tmp/events
                echo "          5 min load: ${N5}"  >> /tmp/events
                echo -e  "          15 min load: ${N15}\n"   >> /tmp/events
        fi
