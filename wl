#!/bin/bash

wicd-cli -y -S &> /dev/null

NeNa=Lozalyon


EID()
{
	echo -e "$(iwconfig wlan0 | grep ESSID: | awk '{print $4}' | head -1 | sed 's/ESSID://' | sed 's/"//' | sed 's/"//')"
}

NID()
{
	echo -e "$(wicd-cli -y -l | grep "$NeNa" | awk '{print $1}')"
}
SCA()
{
	echo -e "$(wicd-cli -y -l | grep "$NeNa" | awk '{print $4}')"
}

STA()
{
	if [ "$(EID)" == 'off/any' ]; then
		echo OFF
	else
		echo $(EID)
	fi
}

CON()
{
	if [[ "$(SCA)" == "$NeNa" && "$(STA)" == "OFF" ]] ; then
		wicd-cli -c -y --network $(NID) &> /dev/null
		echo Connecting
	else	echo Not Found
	fi
}
echo $(CON)