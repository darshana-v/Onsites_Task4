#!/bin/bash
# script to kill processes exceeding a certain memory limit


PROCESS=$(ps -o pid,user,%mem,command ax | grep -v PID | awk '/[0-9]*/{print $1 ":" $2 ":" $4}')

touch ~/kill.txt
echo "The processes killed due to exceeding memory limit are listed." >> ~/kill.txt

for i in $PROCESS
do 
    PID=$(echo $i | cut -d: -f1)
    command=$(echo $i | cut -d: -f3)
    memory=$(pmap $PID | tail -n 1 | awk '/[0-9]K/{print $2}')
    size=${memory%%K*}
    sizeMB=$((size/1024))

    # '$1' is obtained from the input command when the script is first run 
    # and represents the maximum memory limit in MB
    if [ $sizeMB -gt $1 ]; then
        kill -9 "$PID"
        echo "Process ID: $PID has been killed. Memory freed: $sizeMB MB"
        echo "Process ID: $PID  Memory freed: $sizeMB MB" >> ~/kill.txt
    fi

done