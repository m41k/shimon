#!/bin/bash

echo -e "Content-type: text/html\n\n"
ARQA="/tmp/mem.txt"
ARQ="/tmp/mem2.txt"
#LIN=`wc -l $ARQ | cut -d " " -f1`
#if [ $LIN -eq 2 ]; then
# echo "Next Level"
# echo "<meta http-equiv='refresh' content='3;URL=cpu.sh'>"
# exit 0;
#fi

readarray MEM < $ARQ


#echo $QUERY_STRING;
#s[1]=1;

if [ -z $QUERY_STRING ]; then
 echo " "
elif [ $QUERY_STRING -eq ${MEM[1]} ]; then
 #echo "certo"
 sed -i '2d' $ARQ
 LIN=`wc -l $ARQ | cut -d " " -f1`
 if [ $LIN -eq 1 ]; then
  echo "<center>Congratulations!<br> Let's go next level.</center>"
  echo "<meta http-equiv='refresh' content='3;URL=cpu.sh'>"
  exit 0;
 fi


 #wc -l $ARQ
 else
 echo "<center>"
 echo "GAME OVER!"
 SCORE=`wc -l $ARQA | cut -d " " -f1`
 echo "Score:" $(( $SCORE - 2 ))
 echo "<br><a href=cpu.sh>Play again</a>"
 echo "</center>"
 echo > $ARQA
 exit 0;
fi

cat <<EOF
<center>
  <table border=1 width=300 height=300>
    <tr>
      <td bgcolor="green"><a href="play.sh?1" onclick="um()";>1</a></td>
      <td bgcolor="red"><a href="play.sh?2" onclick="dois()";>2</a></td>
    </tr>
    <tr>
      <td bgcolor="yellow"><a href="play.sh?3" onclick="tres()";>3</a></td>
      <td bgcolor="blue"><a href="play.sh?4" onclick="quatro()";>4</a></td>
    </tr>
</center>
