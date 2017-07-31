#!/bin/bash

# A library that gives ASCI art, provided a 
# 1. Folder 
# 2. Chance of trigger


function rollDie {
	# Roll a die, and if you succeed, get a random ASCI art
	max=10
	roll=$[( $RANDOM % $max + 1 ) ]
	if [[ $roll -gt $gauntlet ]]; then
		rollSuccess=true
	else
		rollSuccess=false
	fi 
}

function randomReward {
    totalFiles=$(ls "$gallery_location" | wc -l)
    if [ $totalFiles -eq 0 ]; then 
       	echo "Error: Fill asci_art dir with something first!"
    	exit 1;
    fi
    # You need the +1 compensator
    randomFileIndex=$[( $RANDOM % $totalFiles + 1) ]
    chosenFile=$(ls "$gallery_location" | head -$randomFileIndex | tail -1)
    cat "$gallery_location/$chosenFile"
}


function rewardRNG {
	# Passed parameters as "input"
	gallery_location="$1"
	# Difficulty chance  (Don't be 0!)
	gauntlet=$2

	rollDie;
	if $rollSuccess; then
		randomReward;
	fi
}