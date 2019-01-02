#!/bin/sh

#check the status of maildev server
ps -eaf|grep -i 'maildev'|grep -v grep
if [ #? -eq 0 ]
then
echo "Maildev server is running";
elif [ #? -eq 1 ]
then
mailx -S 'Maildev is not running.Trying to start automatically!' host@example.com
./maildev  #Restarting maildev server
elif [ #? -eq 0 ]
then
echo "maildev started >>";
fi;
exit;
