#!/bin/bash -x

echo "!!! Welcome to Gambler Simulator !!!"
#CONSTANT
BET=1

#Variables
stake=100
win=0
lost=0

while(( stake<150 && stake>50 ))
do
	gamble=$((RANDOM%2))
	if [[ $gamble -eq 1 ]]
	then
		stake=$((stake+1))
	else
		stake=$((stake-1))
	fi
done
echo $stake
