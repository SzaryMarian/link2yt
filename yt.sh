#!/bin/bash

yt=ty.sh

for i in $*; do
	echo "attr: $i"
	if [ "$i" == "-U" ]; then
		echo update
		mv $yt $yt.bak
		wget https://raw.githubusercontent.com/SzaryMarian/link2yt/master/$yt
		exit 0
	fi
	sleep 1s
done

if [ -e *.url ]; then

	for f in *.url; do
	
		echo " file  : $f"
	
		n=`echo ${f%.*} | tr "-" "\n"`
		# while read line; do 
		# 	echo "LINE: '${line}'" 
		# done <<< "$n"
	
		readarray -t y <<<"$n"
		auth=${y[0]}
		titl=${y[1]//[[:blank:]]/}
	
		echo " Author: $auth"
		echo " Title : $titl"
		
		mp3=`basename "$f"`.mp3
		echo $mp3
		
		if [ ! -f "$mp3" ]; then
			c=`cat "$f"`
			readarray -t c <<< `cat "$f"`
			url=`cut -b5- <<< ${c[1]}`
			echo " url   : $url"
			./youtube-dl -v $url -o '%(title)s.%(ext)s' -x --audio-format mp3
			# echo $?
			if [ $? -eq 0 ]; then
				# echo 1
				mv "$f" ./done-urls/
			fi
		else
			echo exists
		fi
	
		echo -e "\n"
	
	done
else
	echo -e "No *.url files found in this directory."
	sleep 3s
fi
