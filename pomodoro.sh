#!/bin/bash
# Provided minutes as an argument for a countdown.

# Pull the library that gives ASCI art, provided a 1. Folder 2. Chance of trigger
source ./get_random_file_from_folder.sh
gallery="./asci_art/"
rcheck_file="./reality_check"

function resetTimer {
    # If there is no input parameters, assume normal Pomodoro time.
    if [ $# == 0 ]
    then
        limit=25
    else
        limit=$1
    fi
    restTimer=5
}

while true
do
	resetTimer;

	# Count and report every minute.
	while [ $limit -gt 0 ]
	do
		echo "Minutes remaining $limit"
		limit=$(( $limit - 1 ))
		# Maybe outputs the reward; the second parameter is the gauntlet difficulty
		rewardRNG "$gallery" "6"
		if $rollSuccess; then
			# Every time there's an award, also check if a reality check happens, with a separate gauntlet
			rcheckRNG "$rcheck_file" "6"
		fi
		sleep 60
	done


	# Once time has passed, notify to start break
	osascript -e 'display notification "Break" with title "Your friendly tomato overlord"'
	echo "Time's up! Walking away?"
	read;

	# Count minutes, resty style
	while [ $restTimer -gt 0 ]
	do
		echo "\~.~/ \~.~/ \~.~/"
		restTimer=$(( $restTimer - 1 ))
        sleep 60
	done

	# Once back to work time, notify
	osascript -e 'display notification "Back" with title "Your friendly tomato overlord"'
	echo "Back. Press any key to restart timer."
	read;
done
