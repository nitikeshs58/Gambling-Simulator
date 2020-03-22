#!/bin/bash -x

echo "!!! Welcome to Gambler Simulator !!!"

#CONSTANT
BET=10

#Variables
stake=100
totalWin=0
totalLost=0

for (( day=1; day<=20; day++ ))
do
	dayWin=0
	dayLost=0
	stakePerDay=100
	while(( $stakePerDay<150 && $stakePerDay>50 ))
	do
		gamble=$((RANDOM%2))
		if [[ $gamble -eq 1 ]]
		then
			stake=$((stake+BET))
			stakePerDay=$((stakePerDay+BET))
			totalWin=$((totalWin+BET))
			dayWin=$((dayWin+BET))
		else
			stake=$((stake-BET))
			stakePerDay=$((stakePerDay-BET))
			totalLost=$((totalLost+1))
			dayLost=$((dayLost+BET))
		fi
	done
	winGamble[$day]=$dayWin
	lostGamble[$day]=$dayLost
done
echo $stake
echo "TotalWin: $totalWin  TotalLost: $totalLost"
echo "Day: ${!winGamble[@]} win: ${winGamble[@]}"
echo "Day: ${!lostGamble[@]} lost: ${lostGamble[@]}"
