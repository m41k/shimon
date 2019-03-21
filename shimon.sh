#!/bin/bash
#--------------------------------------#
# SHIMON - SIMON - GENIUS(BR) FOR BASH #
# CREATED BY: maik.alberto@hotmail.com #
# ARROWS BY: atcasanova@gmail.com      #
#--------------------------------------#

#CORES
A='\e[96m' #cyan
B='\e[91m' #red
C='\e[92m' #green
D='\e[93m' #yellow
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

cima(){
setas "${A}" "${N}" "${N}" "${N}"
}
esquerda(){
setas "${N}" "${B}" "${N}" "${N}"
}
direita(){
setas "${N}" "${N}" "${C}" "${N}"
}
baixo(){
setas "${N}" "${N}" "${N}" "${D}"
}
nulo(){
setas "${N}" "${N}" "${N}" "${N}"
}
p=0;
i=1;
SETAS=( " " cima baixo direita esquerda )
TECLA=( $'\e[F' $'\e[A' $'\e[B' $'\e[C' $'\e[D' )

while [ 1 ]; do
 j=1;
 MEM[$i]=`cat /dev/urandom | tr -dc '1-4' | fold -w 1 | head -n 1`
 NUM=${MEM[$i]}
 MEM2[$i]=${TECLA[$NUM]}
for r in $(seq $i); do
 VERSEQ=${MEM[$r]};
 ${SETAS[$VERSEQ]}
 sleep 0.5
 nulo
 sleep 0.1
done
 sleep 0.5
 while [ $j -le $i ]; do
  nulo
  read  -n3 -s DIG[$j]
  if ! [[ ${DIG[$j]} = ${MEM2[$j]} ]]; then
  echo "Game Over! Score: $p"
  exit 1
  fi
  sleep 0.5
 j=$((j+1))
 done
i=$((i+1))
p=$((p+1))
done
