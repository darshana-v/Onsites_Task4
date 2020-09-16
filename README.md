# Onsites_Task4

## A daemon that kills processes that exceed a custom specified memory limit.

Save the contents of kill_alias.sh in ~/.bashrc
(or)
sudo cat kill_alias >> ~/.bashrc 
to run the scripts

To initiate the process, enter 'kill_process' in the terminal and then enter the maximum memory limit you want to specify in MB.

The process continues forever, and can be modified accordingly to be run once a day, or week according to your wish.

### Warning:
This process does not ask for permission to kill a process, and hence to stop it, remove the crontab from .bashrc file.