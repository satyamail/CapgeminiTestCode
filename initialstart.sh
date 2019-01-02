#!/bin/sh
#one time runnable script;
#installing the maildev server in linux system.
sudo yum install maildev >> 2&1;

#check if the server has started or not.
ps -eaf|grep -i 'maildev'|grep -v grep
if [ $? -eq 0 ] 
then
	#scheduling a cronjob in the crontab which checks if the process is running in every 5 minutes.
crontab -l|crontab -l | { cat; echo "*/5 * * * * searchStatus.sh"; } | crontab -

#use rsync to sync the log files in another location.
rsync -a /path/to/source/*.log /path/to/backup/directory/dev

fi
