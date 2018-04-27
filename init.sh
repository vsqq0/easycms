#!/usr/bin/env bash
sudo apt install docker.io
sudo apt install docker-compose
sudo apt install nodejs-legacy
sudo apt install npm

sudo docker-compose build
sudo docker-compose up -d

cd deploy
sudo npm i
node deploy.js

