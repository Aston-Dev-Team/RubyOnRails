#!/usr/bin/env bash

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

sudo apt-get -y install rbenv

exec $SHELL <<EOF1

echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc


rbenv install 2.3.1
rbenv global 2.3.1

echo 'eval "$(rbenv init -)"' >> ~/.bashrc

sudo gem install bundler
sudo gem update

EOF1

ruby -v
echo "yay..."