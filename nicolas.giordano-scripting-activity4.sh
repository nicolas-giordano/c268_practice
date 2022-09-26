#!/bin/bash

: ' 
Author: Nicolas Giordano
Version: 1
Function: Check users password for security. Must be at least 8 characters, have numbers and letters, and have at least
1 uppercase letter.
 '

REQLENGTH=8

while :
do
	read -p "Enter a password to check its strength: " password
	
	length=$(echo $password | awk '{print length}')
	if [ $length -lt 8 ]
	then 
		echo "Your password must be at least 8 characters."
		continue
	fi
	if [[ $password =~ ^[a-zA-Z]+$ ]]
	then
		echo "Your password must contain at least 1 number."
		continue
	fi
	if [[ $password =~ ^[0-9a-z]+$ ]]
	then
		echo "Your password must have at least 1 capitalized letter."
	else
		echo "Your password is strong!"
		break
	fi
done

exit 0
