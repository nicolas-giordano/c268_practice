#!/bin/bash

: '
Author: Nicolas Giordano
Version: 1
Function: Ask user for 5-10 integers (min 5 max 10) and output the product, average, sum, min of series, and max
of series
 '

i=$((1)) # initial counter
series=() # store all integers user inputs
product=$((1)) # initialize product varialbe for future
sum=$((0)) # initialize sum variable for future

echo "Please enter 5 - 10 integers please! If you wish to stop type 's' and press enter."

while [ $i -lt 11 ] # loop until either 10 integers have been met OR the user presses 's'
do 
	read -p "Enter Integer $i: " integer # prompt user for integer and store it
	
	if [[ $i -ge 5 && $integer == 's' ]] # check if user wants to stop
	then 
		break
	elif [[ $integer =~ ^[^0-9]+$ ]] # check if they did not enter an integer
	then 
		echo "Please only enter integers."
		continue
	fi

	series+=($integer) # add input into an array
	((i++))
done

min=$((${series[0]})) # initialize min and max to first integer in array and compare in for loop
max=$((${series[0]}))

for int in ${series[@]}
do
	product=$((product * int))
	sum=$((sum + int))

	if [ $min -gt $((int)) ]
	then
		min=$((int))
	fi

	if [ $max -lt $((int)) ]
	then
		max=$((int))
	fi
done

average=$((sum / ${#series[@]}))
echo "You entered ${series[@]}."
echo "Product: $product Average: $average Sum: $sum Min: $min Max: $max"

exit 0
