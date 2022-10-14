``` sh
#!/bin/bash

#log file path
LOGFILE=/home/vagrant/logs/ram.log

# Format date
SENDTIME=`echo $(date +%H%M)`


# Email recipient
EMAIL="davidstone097@gmail.com"

# create a log file
function createLog(){
	if [ -f "$LOGFILE" ]; then
                
        date >> $LOGFILE
        free -h >> $LOGFILE

	else
		touch $LOGFILE
		date >> $LOGFILE
		free -h >> $LOGFILE
	fi
}

createLog

if [[ $SENDTIME == 1239 ]]; then
	echo "Hello support, find attached the memory log of the linux server" | mail -s "RAM info" -A $LOGFILE $EMAIL

	rm -rf $LOGFILE
fi
```