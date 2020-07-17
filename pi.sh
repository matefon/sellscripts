#!/bin/bash

###################################################
###	CALC PI					###
###	Script to calculate pi using bc		###
###	written by matefon			###
###################################################

###	Variables	###
package="bc"	# Package name to look for in bcCheck function
lengthDef=30	# Output length (digits) of pi if no argument specified (Warning: calculating values longer than 50 digits take significantly more time)
bcCheckVar=0
length=$1
### 	/Variables	###

###	Check if bc is installed or not	###
function bcCheck {
	dpkg -s $package &> /dev/null

	if [ $? == 0 ]; then
		bcCheckVar=1
	else
		echo -e "bc is not installed! It is required for scientific calculations."
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

while [ "$bcCheckVar" == 0 ]; do
bcCheck
done

###	Check if length argument is specified or not	###

if [ "$1" == "" ]; then
	length=$lengthDef
elif [ "$1" == "-h" ] || [ "$1" == "-H" ] || [ "$1" == "--help" ] || [ "$1" == "help" ] || [ "$1" == "HELP" ]; then
	echo -e "##################################################"
	echo -e "Welcome $USER \b!"
	echo -e "This simple script allows you to calculate the pi."
	echo -e "Default length is 30 (digits). You can change that by specifying the first argument as a number."
	echo -e "(Warning: calculating values longer than 50 digits take significantly more time)"
	echo -e "##################################################"
	length=$lengthDef
	exit
else
	length=$1
fi

###	OUTPUT	###
{ echo -n "scale=$length;"; seq 1 2 200 | xargs -n1 -I{} echo '(16*(1/5)^{}/{}-4*(1/239)^{}/{})';} | paste -sd-+ | bc -l
