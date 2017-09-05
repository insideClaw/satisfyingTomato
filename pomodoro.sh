#!/bin/bash
# Provided minutes as an argument for a countdown.

# Pull the library that gives ASCI art, provided a 1. Folder 2. Chance of trigger
source ./get_random_file_from_folder.sh 
gallery="./asci_art/"

# If there is no input parameters, assume normal Pomodoro time.
if [ $# == 0 ]
then
  limit=25
else
  limit=$1
fi
restTimer=5

while true
do

	# Count and report every minute.
	while [ $limit -gt 0 ]
	do
		echo "Minutes remaining $limit"
		limit=$(( $limit - 1 ))
		rewardRNG "$gallery" "8"
		sleep 60
	done

	# Once time has passed, notify.
	osascript -e 'display notification "You dont have to walk, but do rest" with title "Your friendly tomato overlord"'
	echo "Time's up!"

	# Count minutes, resty style
	while [ $restTimer -gt 0 ]
	do
		echo "\~.~/ \~.~/ \~.~/"
		restTimer=$(( $limit - 1 ))
		sleep 60
	done

	# Once back to work time, notify
	osascript -e 'display notification "Back" with title "Your friendly tomato overlord"'
	echo "Back. Press any key to restart timer."
	read;
done
