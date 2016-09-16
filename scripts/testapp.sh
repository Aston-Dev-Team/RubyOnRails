#!/bin/bash

NC='\033[0m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'

$SHELL<<EOF1
	
	cd apps/

	if [ -d "testapp/" ]; then
		echo -e "${YELLOW}testapp already created${NC}"
	else
		sudo rails new testapp #-d mysql
	fi

	cd testapp/
	sudo rails server -b 0.0.0.0 > /dev/null &

EOF1

echo "yay..."