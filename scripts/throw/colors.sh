### bash escape char: \e or \033 or \x1B
### echo -e colors: (light example: light green=\e[92m
defc="\e[39m" # default color
black="\e[30m"
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
magenta="\e[35m"
cyan="\e[36m"
lightgray="\e[37m"
darkgray="\e[90m"
white="\e[97m"
### background colors:
# default=\e[49m
# black=\e[40m
# blue=\e[44m
# dark gray=\e[100m
# light red=\e[101m
# white=\e[107m
### echo -e formats:
bold="\e[1m"
dim="\e[2m"
underlined="\e[4m"
blink="\e[5m"
inverted="\e[7m"
hidden="\e[8m"
### reset formats:
resetall="\e[0m"
resetbold="\e[21m"
resetdim="\e[22m"
resetunderlined="\e[24m"
resetblink="\e[25m"
resetinverted="\e[27m"
resethidden="\e[28m"
### bold and underlined example:
# \e1;4m
### bold, red text and green background:
# \e[1;31;42m
resAll="\e[0;39;49m" # reset all colors and formats to default
resEB="\e[21;22;24;27;28;39;49m" # reset all except blinking
startText="\e[1;97;104m"
helpText="\e[94m"
commandsText=$resAll #"\e[93m"
writeHashText="\e[1;97;104m"