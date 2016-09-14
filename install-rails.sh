#!/usr/bin/env bash

sudo gem install rails -v 4.2.6

exec $SHELL <<EOF1

	rbenv rehash
	rails -v

EOF1