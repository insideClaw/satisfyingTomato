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

# Count and report every minute.
while [ $limit -gt 0 ]
do
	echo "Minutes remaining $limit"
	limit=$(( $limit - 1 ))
	rewardRNG "$gallery" "8"
	sleep 60
done

# Once time has passed, notify.
echo "Time's up!"
osascript -e 'display notification "Now is pomodoro time!" with title "Your friendly tomato overlord"'
