#!/bin/bash


read -p "Enter the maximum memory limit in MB." max
chmod +x memory_daemon.sh
alias kill_process='./memory_daemon.sh $max'

crontab -e
* * * * * kill_process