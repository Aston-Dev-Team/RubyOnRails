#!/bin/sh

sudo apt-get clean
sudo apt-get -qq update
sudo apt-get -y upgrade
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get -y install nodejs

#/var/cache/apt/archives/mysql-server-5.5_5.5.52-0ubuntu0.14.04.1_amd64.deb
sudo apt-get -y install mysql-server-5.5 mysql-client-5.5 libmysqlclient-dev


echo "yay..."

