#!/bin/bash
#Generate Alarm Raw Data

echo "Enter the following format:YYYY-MM to retrieve the alarm information:"

read date

if [[$date]]; then

alarmsfilename="/var/lib/mysql-files/alarms_$(date +%Y%m%d%H%M%S).csv";clear;echo "OUTPUT FILE :" $alarmsfilename;echo "select a.timestamp, a.status, d.name,c.subcategory, a.risk,inet6_ntoa(a.src_ip),inet6_ntoa(a.dst_ip) from alarm a join backlog b ON a.backlog_id=b.id AND a.timestamp like '${date}-%' JOIN alarm_taxonomy c ON b.directive_id=c.sid AND a.corr_engine_ctx=c.engine_id JOIN alarm_categories d ON c.category=d.id order by timestamp DESC INTO OUTFILE '${alarmsfilename}' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n';" | ossim-db

else echo "Invalid"

fi
