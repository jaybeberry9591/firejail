#!/bin/bash
# This file is part of Firejail project
# Copyright (C) 2014-2017 Firejail Authors
# License GPL v2

export MALLOC_CHECK_=3
export MALLOC_PERTURB_=$(($RANDOM % 255 + 1))

LIST="firefox midori chromium opera transmission-qt qbittorrent uget-gtk filezilla gthumb thunderbird "
LIST+="vlc fbreader deluge gnome-mplayer xchat wine kcalc ktorrent"

for app in $LIST; do
	which $app
	if [ "$?" -eq 0 ];
	then
		echo "TESTING: $app"
		./$app.exp
	else
		echo "TESTING SKIP: $app not found"
	fi
done

