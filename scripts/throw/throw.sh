#!/bin/bash

###########################################################################
###	A SCRIPT TO CALCULATE THINGS ABOUT THROWING			###
###	ONLY SUITABLE IF V0 is not vertical nor horizontal.		###
###									###
###	Required packages: bc (to calculate cos).			###
###	(If not installed, the script will do it automatically		###
###	if it has root access or you can install it manually.		###
###########################################################################

###	written by							###

. ./colors.sh
#. ./cosine.sh # = source cosine.sh
. ./sine.sh

##### SCRIPT #####
x=0

function writeHash {
	echo -e "$writeHashText \b##################################################$resAll"
}
function start {
	echo -e "$startText \b##################################################$resAll"
        echo -e "$startText \b######                                      ######$resAll"
        echo -e "$startText \b#####                                        #####$resAll"
        echo -e "$startText \b######                                      ######$resAll"
        echo -e "$startText \b##################################################$resAll"
}
function commands {
	echo -e "$commandsText \b\e[7m##################################################$resAll"
	echo -e "$commandsText \b1\tdistance\t\t2\tx\n3\ty\t\t	$resAll"
	echo -e "$commandsText \b\e[7m##################################################$resAll"
}
function help1 {
	echo -e "$helpText \b##################################################$resAll"
	echo -e "$helpText \bWelcome \e[7m$USER \e[7m\b!$resAll"
	echo -e "$helpText \bThis is a script to calculate some throwing things.$resAll"
	echo -e "$helpText \bType the letter and hit enter to calculate.$resAll"
	echo -e "$helpText \bPress CTRL+C or enter q to exit. Enter h to show the list of commands.$resAll"
	echo -e "$helpText \b##################################################$resAll"
}
function help2 {
	commands
}
function getV0 {
	echo -e "Type v0 and hit enter:"
	read v0
}
function getAlpha {
        echo -e "Type alpha and hit enter:"
        read alpha
}
function getG {
	echo -e "Type g and hit enter. Default is -9.81 m/^2, skip with enter."
	read g
	if [ "$g" == "" ]; then
		echo -e "Using default value (-9.81 m/s^2)."
		g="-9.81"
	fi
}
function calcTv {
#t(v)=-(2*v0*sinAlpha)/g
	#sinAlpha="$(./sine.sh $alpha)"
	degree=$alpha
	deg2rad
	sinAlpha="$(sin)"
	#Tv="(-1 * (2 * $v0 * $sinAlpha) / $g)"
	Tv=$(bc -l <<< "-2 * $v0 * $sinAlpha * $g")
}
function calcDistance {
#d=v(0)*t(v)*cos(Alpha)
	#cosAlpha="$(./cosine.sh short $alpha)"
	cosAlpha="$(cos)"
	#distance="$v0 \* $Tv \* $cosAlpha"
	distance=$(bc -l <<< "$v0 * $Tv * $cosAlpha")
}

function silent {
	calcTv
	calcDistance
	result=$distance
	echo $result
}

if [ "$1" == "silent" ]; then
	v0="$2"
	alpha="$3"
	g="-9.81"
	silent
	exit
fi

start
help1
echo -e "$resAll"

#args
#end args

while true; do
read input
if [ "$input" = "1" ]; then
	writeHash
	echo -e "You selected to calculate the distance."
	echo -e "This is suitable when you want to know how far a ball will go."
	echo -e "I need 3 infos: v0, alpha and g."
	getV0
	getAlpha
	getG
	calcTv
	calcDistance
	writeHash
	result=$distance
	#echo -e "Result is: \n$result"
	echo -e "Result is:"
	echo -e $result "m"
	writeHash
elif [ "$input" = "2" ]; then
	writeHash
elif [ "$input" = "3" ]; then
	writeHash
elif [ "$input" = "4" ]; then
	writeHash
elif [ "$input" = "5" ]; then
	writeHash
elif [ "$input" = "6" ]; then
	writeHash
elif [ "$input" = "7" ]; then
	writeHash
elif [ "$input" = "8" ]; then
	writeHash
elif [ "$input" = "9" ]; then
	writeHash

### help and quit
elif [ "$input" = "h" ]; then
	help2
elif [ "$input" = "H" ]; then
	help2
elif [ "$input" = "q" ]; then
	exit
elif [ "$input" = "Q" ]; then
	exit
else 
	echo -e "$red \bInvalid selection! Try again."
fi
done
