#!/bin/bash

$SHELL<<EOF1
	
	echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

EOF1


