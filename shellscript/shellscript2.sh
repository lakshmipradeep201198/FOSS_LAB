#!/bin/bash

echo "Computer CPU information like processor type, speed : $(lscpu)"
echo "Compter CPU information like processor type , speed : echo $(sudo dmidecode -t 4)"
echo "Memory information : $(free -m)"
echo "All available shells : cat /etc/shells"
echo "Mouse settings : echo $(xinput --list --short)"
echo "Hard disk information : echo $(sudo dmidecode -t memory)"
echo "File system (Mounted) : echo $(sudo fdisk -l)"

