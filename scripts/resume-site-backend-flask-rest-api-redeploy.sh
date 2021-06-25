#!/bin/bash


sudo docker pull tylerlott/resume-site-backend-flask-rest-api:prod
sudo docker stop resume-site-backend-flask-rest-api
sudo docker image prune -f
sudo docker container prune -f
sudo docker run -d --network resume-site-network-prod --name=resume-site-backend-flask-rest-api tylerlott/resume-site-backend-flask-rest-api:prod
