#!/usr/bin/env bash
sudo apt install docker.io
sudo apt install docker-compose
sudo apt install nodejs-legacy
sudo apt install npm

cd deploy
sudo npm i
sudo ./deploy.sh

echo "successful!"