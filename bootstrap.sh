#!/bin/bash

#echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

#/usr/share/man/man1/hiera.1.gz
#/usr/bin/hiera
#/usr/lib/ruby/vendor_ruby/hiera.rb
#/usr/lib/ruby/vendor_ruby/hiera/
#sudo do-release-upgrade

var1="16.04"
var2=`lsb_release -r | awk '{ print $2 }'`

if [ "$var2" != "$var1" ]; then
	sudo do-release-upgrade -d -f DistUpgradeViewNonInteractive
else
	echo "Already Ubuntu 16.04"
fi


sudo apt-get -qq update
sudo apt-get -y dist-upgrade

sudo apt-get -y install zlib1g-dev liblzma-dev
sudo apt-get -y install bundler
sudo apt-get -y install gem
sudo apt-get -y install rails
sudo apt-get -y install ruby-dev

sudo gem update

sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password password congrats'
sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password_again password congrats'
sudo apt-get -y install mysql-server-5.7
sudo apt-get -y install libmysqlclient-dev