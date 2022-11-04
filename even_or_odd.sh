#!/bin/bash 
COUNT=0
rest=0
even=-1

if [ $# -lt 2 ]
then
	echo "Not enough arguments"
        echo "Example: ./script_name.sh [-e|-o] [file.txt]++"
elif [ $1 == "-e" ]
then 
	even=1
elif [ $1 == "-o" ]
then
	even=0
elif [ $1 != '-e' ] & [ $1 != '-o' ]
then
	echo "Wrong option"
	echo "Example: ./script_name.sh [-e|-o] [file.txt]++"
fi
	
shift

while (($# > 0))
do
	while read line
	do
	     ((COUNT++))
	     let rest=COUNT%2

	     if [ $even == 1 ]
	     then 
		     if [ $rest -eq 0 ]
	     	     then
		       	 	echo $line
		     fi
	     elif [ $even == 0 ]
	     then
		     if  [ $rest -ne 0 ] 
	     	    	then
		     		echo $line
		     fi
	     fi
	done < $1
	shift		
done
