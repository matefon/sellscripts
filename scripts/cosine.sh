#!/bin/bash

#######################################################
###	Script to calculate cosine of degree using bc	###
###	written by matefon								###
#######################################################

###	Variables	###
package="bc"
bcCheckVar=0
### /Variables	###

###	Check if bc is installed or not	###
function bcCheck {
	dpkg -s $package &> /dev/null

	if [ $? == 0 ]; then
#		echo "bc  is installed!"
		bcCheckVar=1
	else
		echo -e "bc is not installed! It is required to calculate cosine."
		echo -e "Would you like to install? (y/n)"
		echo -e "Install (apt) require root access."
		echo -e "If your OS's package manager is not apt, install bc manually."
		read answer
		if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; then 
			apt install bc
			bcCheckVar=0
		else exit
		fi
	fi
}
### Convert degrees to radians (with 100 digit pi)
function deg2rad {
	pi="3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679"
        radian="$degree * ($pi / 180)"
}
### Calculate cosine
function cos {
	bc -l <<< "c($radian)"
}
### bc installation check until it is installed
while [ "$bcCheckVar" == 0 ]; do
bcCheck
done

### Check if first argument specified
# If h then show help
if [ "$1" == "-h" ] || [ "$1" == "-H" ] || [ "$1" == "--help" ] || [ "$1" == "help" ] || [ "$1" == "HELP" ]; then
	echo -e "##################################################"
	echo -e "Welcome $USER \b!"
	echo -e "This simple script allows you to calculate the cosine of a degree."
	echo -e "Pre-specify a degree with the first argument to echo the result."
	echo -e "The script asks for a number if no argument specified."
	echo -e "##################################################"
# If not then ask for a number
elif [ "$1" == "" ]; then
	echo -e "Type an angle in degrees!"
	read number
	#degree=45
	degree=$number
	deg2rad
	cos
# If yes then echo the result
elif [ "$1" != "" ]; then
	degree="$1"
	deg2rad
	result="$(cos)"
	echo "$result"
fi
