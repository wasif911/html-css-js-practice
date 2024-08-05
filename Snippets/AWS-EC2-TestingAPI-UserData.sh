#!/bin/bash

apt-get update
apt-get install wget unzip nodejs npm -y
npm install -g nodemon pm2
wget https://github.com/thenabeelhassan/testingapi/archive/refs/heads/main.zip
unzip main.zip
mkdir /code
mv testingapi-main /code/testingapi
rm -f main.zip
cd /code/testingapi
npm i
pm2 start index.js --name "Testing API"
pm2 save
