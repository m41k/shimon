#!/bin/bash
echo -e "Content-type: text/html\n\n"
ARQ="/tmp/mem.txt"
###FUNCAO INCLUIR CORES COM TIMER NA FUNCAO JS_MP
_INC_COR(){
#	R[$i]=`echo $(((RANDOM% 4)+1))`
#        echo ${R[$i]} >> $ARQ
	echo $(((RANDOM% 4)+1)) >> $ARQ
	LIN=`wc -l $ARQ | cut -d " " -f1`
	LOOP=$(( $LIN - 1 ))
	T=0
        echo "setTimeout(cor0, $((1000 * $i + 0)));"
 for ((i=1;i<=$LOOP;i++)); do
        readarray MEM < $ARQ
#	R[$i]=`echo $(((RANDOM% 4)+1))`
#        echo ${R[$i]} >> /tmp/mem.txt
        ME=`echo ${MEM[$i]}`
        echo -e "setTimeout(cor$ME, $((1000 * $i )))"
        echo "setTimeout(cor0, $((1000 * $i + 200)));"
 done
#        echo "setTimeout(cor5, $((1000 * ${#R[@]} + 500)));"
        echo "setTimeout(\"location.href='play.sh';\",  $((1000 * ${#MEM[@]} + 500)));"

}


###FUNCOES PARA EXIBICAO HTML+JS

_DIV(){
 cat <<EOF
     <body onload="teste();">
     <div id="conteudo">
     </div>
EOF
}

_JS_MP(){
 cat <<EOF
    <script>
     function teste(){
EOF
   _INC_COR
   cat <<EOF
	}
	var request = new XMLHttpRequest();
EOF
}

_JS_COR(){
 cat <<EOF
	function cor$1(){
		request.open("POST", "../$1.html", true);
		request.onreadystatechange = function(){
		document.getElementById("conteudo").innerHTML = request.responseText;
		}
		request.send(null);
	}
EOF
}

_CLIC(){
 cat <<EOF
function cima()
        {
        xmlhttp.open("GET","teste.cgi?cima", true);
        xmlhttp.send();
        }
EOF
}

_FECHA_SCRIPT(){
 cat <<EOF
 </script>
EOF
}
_DIV
_JS_MP
_JS_COR 0
_JS_COR 1
_JS_COR 2
_JS_COR 3
_JS_COR 4
_JS_COR 5
_CLIC
_FECHA_SCRIPT
cp /tmp/mem.txt /tmp/mem2.txt
