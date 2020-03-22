#!/bin/bash -x

echo "!!! Welcome to Gambler Simulator !!!"

#CONSTANT
BET=10

#Variables
stake=100
totalWin=0
totalLost=0

#max lucky day function
function luckyMaxDay
{
local maxLucky=$1
for (( day=1;day<=20;day++ ))
do
	if [[ ${winGamble[$day]} -gt $maxLucky ]]
	then
		maxLucky=${winGamble[$day]}
		luckiestDay=$day
	fi
done
echo $luckiestDay
}

#max unlucky day function
function unluckyMaxDay
{
local maxUnlucky=$1
for ((  day=1;day<=20;day++ ))
do
	if [[ ${lostGamble[$day]} -gt $maxUnlucky ]]
	then
		maxUnlucky=${lostGamble[$day]}
		unluckiestDay=$day
	fi
done
echo $unluckiestDay
}

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
luckyDay=$( luckyMaxDay ${winGamble[1]} )
unluckyDay=$( unluckyMaxDay ${lostGamble[1]} )

echo "LuckyDay : $luckyDay  UnluckyDay: $unluckyDay"
