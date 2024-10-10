#!/bin/bash

cmd=$1
File="PID.txt"

case $cmd in
"START")
	if [ ! -e $File ]
	then
	  chmod a+rwx child.sh
	  ./child.sh & echo $! > $File
        echo | cat $File
	fi
	;;

"STOP")
	if [ ! -e $File ]
	then
		echo "process is not running"
	else
    		kill -9 "$(cat $File)"
    		rm "$File"
	fi
	;;

"STATUS")
	if [ ! -e $File ]
	then
		echo "stopped"
	else
		echo "running"
	fi
esac
