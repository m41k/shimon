#!/bin/bash
#--------------------------------------#
# SHIMON - SIMON - GENIUS(BR) FOR BASH #
# CREATED BY: maik.alberto@hotmail.com #
# ARROWS BY: atcasanova@gmail.com      #
#--------------------------------------#

[[ $1 == -s ]] && FazSom=1 || FazSom=0

#CORES
CYAN='\e[96m' #cyan
RED='\e[91m' #red
GREEN='\e[92m' #green
YELLOW='\e[93m' #yellow
USER='\e[95m' #magenta
N='\e[39m' #normal

#FORMAS
LN="\e(0\x71\e(B" #line
LU="\e(0\x6d\e(B" #leftup
RU="\e(0\x6a\e(B" #rightup
RD="\e(0\x6b\e(B" #rightdown
LD="\e(0\x6c\e(B" #leftdown
CL="\e(0\x78\e(B" #Vertical

#COMPOSTOS
BU="$LU$LN$LN$LN$LN$RU" #baseup
BD="$LD$LN$LN$LN$LN$RD" #basedown"
BV="$CL....$CL" #bodyVertical

#LINHAS
HU1="$LU$LN$RD....$LD$LN$RU" #headup1
HU2="$LD$RU......$LU$RD" #headup2
HU3="$LD$RU....$LU$RD" #headup3
HU4="$LD$RU..$LU$RD" #headup4
HU5="$LD$RU$LU$RD" #headup5
TOP="$LD$RD" #topo
HD1="$LD$LN$RU....$LU$LN$RD" #headup1
HD2="$LU$RD......$LD$RU" #headup2
HD3="$LU$RD....$LD$RU" #headup3
HD4="$LU$RD..$LD$RU" #headup4
HD5="$LU$RD$LD$RU" #headup5
BOT="$LU$RU" #fundo

#FORMAS
LN="\e(0\x71\e(B" #line
LU="\e(0\x6d\e(B" #leftup
RU="\e(0\x6a\e(B" #rightup
RD="\e(0\x6b\e(B" #rightdown
LD="\e(0\x6c\e(B" #leftdown
CL="\e(0\x78\e(B" #Vertical

#COMPOSTOS
BU="$LU$LN$LN$LN$LN$RU" #baseup
BD="$LD$LN$LN$LN$LN$RD" #basedown"
BV="$CL....$CL" #bodyVertical

#LINHAS
HU1="$LU$LN$RD....$LD$LN$RU" #headup1
HU2="$LD$RU......$LU$RD" #headup2
HU3="$LD$RU....$LU$RD" #headup3
HU4="$LD$RU..$LU$RD" #headup4
HU5="$LD$RU$LU$RD" #headup5
TOP="$LD$RD" #topo
HD1="$LD$LN$RU....$LU$LN$RD" #headup1
HD2="$LU$RD......$LD$RU" #headup2
HD3="$LU$RD....$LD$RU" #headup3
HD4="$LU$RD..$LD$RU" #headup4
HD5="$LU$RD$LD$RU" #headup5
BOT="$LU$RU" #fundo

setas(){
	clear	
	echo -e "$1
                   $TOP
                  $HU5
                 $HU4
                $HU3
               $HU2	
               $HU1
                 $BV
                 $BV
                 $BV
$2      $LD$LN$RD        $1$BU        $3$LD$LN$RD 
$2    $LD$LN$RU.$CL                      $3$CL.$LU$LN$RD           
$2  $LD$LN$RU...$LU$LN$LN$LN$LN$LN$LN$LN$LN$LN$RD   $3$LD$LN$LN$LN$LN$LN$LN$LN$LN$RU...$LU$LN$RD
$2 $LD$RU...............$CL   $3$CL..............$LU$RD
$2 $LU$RD...............$CL   $3$CL..............$LD$RU
$2  $LU$LN$RD...$LD$LN$LN$LN$LN$LN$LN$LN$LN$LN$RU   $3$LU$LN$LN$LN$LN$LN$LN$LN$LN$RD...$LD$LN$RU
$2    $LU$LN$RD.$CL                      $3$CL.$LD$LN$RU
$2      $LU$LN$RU        $4$BD        $3$LU$LN$RU
$4                 $BV
$4                 $BV
$4                 $BV
$4               $HD1
$4               $HD2
$4                $HD3
$4                 $HD4
$4                  $HD5
$4                   $BOT
$N
"
}
trap ctrl_c INT

ctrl_c(){
 stty sane
 echo Score: $p
 exit 1;
}

Som()
{
	(( FazSom )) || return
	case $1 in
		A) aplay test.wav &>-  ;;
		B) aplay alert.wav &>- ;;
		C) aplay receive.wav &>-  ;;
		D) aplay send.wav &>-  ;;
	esac
}; export -f Som


pisca(){
	case $1 in
		A) setas "${CYAN}" "${N}" "${N}" "${N}" ;;
		B) setas "${N}" "${N}" "${N}" "${YELLOW}" ;;
		C) setas "${N}" "${N}" "${GREEN}" "${N}" ;;
		D) setas "${N}" "${RED}" "${N}" "${N}" ;; 
		nulo) setas "${N}" "${N}" "${N}" "${N}" ;;
	esac
	Som $1
}

piscauser(){
	case $1 in
		A) setas "${USER}" "${N}" "${N}" "${N}" ;;
		B) setas "${N}" "${N}" "${N}" "${USER}" ;;
		C) setas "${N}" "${N}" "${USER}" "${N}" ;;
		D) setas "${N}" "${USER}" "${N}" "${N}" ;; 
	esac
}

p=0;
TECLA=(F A B C D)
stty -echo
for ((i=1;;i++)); do
	pisca nulo
	j=1;
	MEM[$i]=`shuf -i 1-4 -n1`
	MEM2[$i]=${TECLA[${MEM[$i]}]}
	for r in $(seq $i); do
		pisca ${TECLA[${MEM[$r]}]} 
		sleep 0.5
		pisca nulo
		sleep 0.1
	done
	sleep 0.5 
	for ((j=1;j<=$i;j++)); do
		pisca nulo
		read -sn2; read -sn1 DIG[$j]
		piscauser ${DIG[$j]};
		if ! [ ${DIG[$j]} = ${MEM2[$j]} ]; then
			echo "Game Over! Score: $p"
			stty sane
			exit $p
		fi
		sleep 0.5
	done
	((p++))
done
