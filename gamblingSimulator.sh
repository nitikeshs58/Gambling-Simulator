#!/bin/bash -x

echo "!!! Welcome to Gambler Simulator !!!"
#CONSTANT
BET=1

#Variables
stake=100
win=0
lost=0
day=0
totalWin=0
totalLost=0
while(( $day<20 ))
do
	while(( $stake<150 && $stake>50 ))
	do
		gamble=$((RANDOM%2))
		if [[ $gamble -eq 1 ]]
		then
			stake=$((stake+BET))
			totalWin=$((totalWin+BET))
		else
			stake=$((stake-BET))
			totalLost=$((totalLost+1))
		fi
	done
	day+=1
done
echo $stake
echo "TotalWin: $totalWin  TotalLost: $totalLost"

