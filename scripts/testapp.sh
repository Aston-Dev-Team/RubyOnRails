#!/bin/bash

$SHELL<<EOF1
	#echo $PWD

	sudo rails new testapp #-d mysql
	cd testapp/
	sudo rails server -b 0.0.0.0 > /dev/null &

EOF1

echo "yay..."