#!/usr/bin/bash
sudo apt-get udpate -y && sudo apt-get upgrade -y
sudo apt-get install curl
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
npm install webtorrent-cli -g
