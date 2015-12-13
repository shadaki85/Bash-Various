#!/bin/bash

#############
#Script by .Shadaki.
#calculator exercize - 9-Dec-2015
#############




##ENTRY POINT

#Some useful Vars
usage="Usage: calculator [number] [operator] [number].\n Numbers can be decimal and/or negative. Permitted operators are: +, -, x, /, %\n";


# Checking if the user knows how the command works or if is trying to break the calc :)
if [ "$#" -ne 3 ]; then

	echo -e "Wrong number of params!";
	echo -e "$usage";
	exit

fi

#Checking if first and third parameters are numbers (negative and decimal included!)
if ! [[ "$1" =~ ^-?[0-9]+([.][0-9]+)?$ ]] || ! [[ "$3" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then

	echo -e "Wrong param!";
	echo -e "$usage";
	exit

else

		case "$2" in

	[+])
		result=$(perl -e "print $1+$3");
		echo -e "Addiction: "$result;
		exit;
		;;
	[-])
		result=$(perl -e "print $1-$3");
		echo -e "Subtraction: "$result;
		exit;
		;;
	[x])
		result=$(perl -e "print $1*$3");
		echo -e "Multiplication: "$result;
		exit;
		;;
	[/])
		if [ $3 != 0 ]; then
			result=$(perl -e "print $1/$3");
			echo -e "Division: "$result;
			exit;
		fi		
			echo -e "Sorry, can't divide by 0!";
		exit;
		;;
	[%])
		if [ $3 != 0 ]; then
			result=$(perl -e "print $1%$3");
			echo -e "Module: "$result;
			exit;
		fi		
			echo -e "Sorry, can't divide by 0!";
		exit;
		;;
	*)
		echo -e "Wrong param!";
		echo -e "$usage";
		exit	
	esac;

fi
