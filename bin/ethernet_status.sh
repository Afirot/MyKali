#!/bin/bash

#Author= PestisKrieg
#Description = Este es un script pensado para su uso en polybar, este script identificara cual de las interfaces de red esta
#en uso identificando cual de ellas tiene asignada una ip e imprimira la ip y un simbolo que identificara la interfaz que
#esta en uso

#Para ello, la interfaz hara grep buscando la ip en las dos interfaces que usa mi pc (eth0 y wlan0, si hay mas o distintas
#interfaces debera de cabiarse)usando el comando ifconfig si no encuentra una ip en una de las interfaces pasa a la siguiente
# y asi hasta dar el mensaje de *Disconected* en caso de que no encuentre ninguna ip en las interfaces especificadas.

#Es recomendable tener instalados los simbolos de nerdfonts.


ETH=$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')
WLAN=$(/usr/sbin/ifconfig wlan0 | grep "inet " | awk '{print $2}')
#MON=$(/usr/sbin/ifconfig wlan0mon | grep "flags " | awk '{print $2}')

if [ $ETH ];
then
        echo "%{F#ff0000} %{F#ffffff} $ETH%{u-}"
elif [ $WLAN ];
then
        echo "%{F#ff0000}直%{F#ffffff} $WLAN%{u-}"
#elif [ $MON ];
#then
#        echo "%{F#ff0000}直%{F#ffffff} MONITOR{u-}"
else
        echo "%{F#ff0000}󱐤 %{F#ffffff}Disconnected"
fi
#echo "%{F#ff0000} %{F#ffffff}$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}' && /usr/sbin/ifconfig wlan0 | grep "inet " | awk '{print $2}')%{u-}"

#echo "%{F#ff0000} %{F#ffffff}$(/usr/sbin/ifconfig wlan0 | grep "inet " | awk '{print $2}')%{u-}"
#ifconfig eth0 | grep "inet " | awk '{print $2}' && ifconfig wlan0 | grep "inet " | awk '{print $2}'
