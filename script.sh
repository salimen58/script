#!/bin/bash
#Docker setup
echo "------------Docker setup----------"
sudo apt update && sudo apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
#sudo apt-get install docker-ce docker-ce-cli containerd.io -y
#sudo service docker start
echo "Wait docker servise start..."
sleep 20
#MongoDB setup
echo "------------MongoDB setup---------"
sudo docker pull mongo
sudo docker create --name mongodb -p 27017:27017 mongo
sudo docker start mongodb
echo "Wait mongo start..."
sleep 10
echo "Check mongodb access on 27017 port..."
curl localhost:27017

#Nginx setup
echo "------------Nginx setup---------"
sudo docker pull nginx
sudo docker build -t nginx-server nginx
sudo docker create --name nginx-server --network=host  nginx-server
sudo docker start nginx-server 
echo "Wait nginx start..."
sleep 10
echo "Check mongodb access on 27018 port..."
curl localhost:27018

