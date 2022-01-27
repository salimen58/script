#!/bin/bash
#Docker setup
echo "------------Docker setup----------"
sudo apt update && sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo service docker start

#MongoDB setup
echo "------------MongoDB setup---------"
sudo docker pull mongo
sudo docker create --name mongodb -p 27017:27017 mongo
sudo docker start mongodb
curl localhost:27017

#Nginx setup
echo "------------Nginx setup---------"
sudo docker pull nginx
sudo docker build -t nginx-server nginx
sudo docker create --name nginx-server --network=host -p 27018:27018 nginx-server
sudo docker start nginx-server 
curl localhost:27018

