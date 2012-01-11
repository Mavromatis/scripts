#!/bin/bash
mpd_pause()
{
	if [[ $(mpc | awk 'NR==2 {print $1}') == "[paused]" ]] ; then
	echo "||"
	elif [[ $(mpc | awk 'NR==2 {print $1}') == "[playing]" ]] ; then
	echo "|>"
	else echo ""
	fi
}

mpd_a()
{
	if [[ $(mpd_pause) == '||' ]] ; 
then
		echo M
		#echo -e "[$(mpc -f %artist% | head -1) - $(mpc -f %title% |head -1)$(mpd_pause)$(mpc | awk 'NR==2 {print $3}')"
	elif [[ $(mpd_pause) == '|>' ]] ;
then
		echo L
		#echo -e "[$(mpc -f %artist% | head -1) - $(mpc -f %title% |head -1)|>$(mpc | awk 'NR==2 {print $3}')"
	else echo "q"
fi
}
echo $(mpd_a)
echo $(mpd_pause)