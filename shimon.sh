#!/bin/bash
#--------------------------------------#
# SHIMON - SIMON - GENIUS(BR) FOR BASH #
# CREATED BY: maik.alberto@hotmail.com #
#--------------------------------------#

A=$(tput setaf 1)
B=$(tput setaf 2)
C=$(tput setaf 3)
D=$(tput setaf 4)
N=$(tput setaf 7)

setas(){
clear
cat <<EOM
                     $1.
                   .:;:.
                 .:;;;;;:.
                   ;;;;;
                   ;;;;;
                   ;;;;;
                   ;;;;;
                   ;:;;;
$2     .                            $3.
$2   .;;............    $3............;;.
$2 .;;;;::::::::::::    $3::::::::::::;;;;.
$2  ':;;::::::::::::    $3::::::::::::;;:'
$2    ':                            $3:'
$4
                   ;;;;;
                   ;;;;;
                   ;;;;;
                   ;;;;;
                   ;;;;;
                 ..;;;;;..
                  ':::::'
                    ':'

${N}
EOM
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
