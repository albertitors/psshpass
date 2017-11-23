#!/bin/sh

#       Author: Alberto Rojas Saez (albertorojassaez@gmail.com)
#       GitHub: https://github.com/albertitors/
#       Description: This script is for execute a command in several hosts passing the password as an argument.
#       Example:
#               ./psshpass.sh "user1" 'pass123' "df -h"
#       Other uses: You can pass the variables in the arguments or in hard as appears next:
#               command="$command df -m /; "
#               command="$command cd /; "
#               command="$command du -sk * | sort -rn; "

user=$1
pass=$2
command=$3

command="hostname; $command"

sshpass -p $pass pssh -h servers.txt -l $user -A -i "$command" > sshpass_pssh.log
