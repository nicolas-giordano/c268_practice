#!/bin/bash

: ' 
Author: Nicolas Giordano
Version: 1
Function: Read in a file, sort the numbers, and output the unique numbers in reverse.
 '

array=($(cat "numbers.txt")) # store file as an array

IFS=$'\n' # change internal field separator 
sorted=($(sort -urn <<<"${array[*]}")) # output array elements and push into sort function
unset IFS # reset field separator 

echo "Sorted ${sorted[@]}"

exit 0
