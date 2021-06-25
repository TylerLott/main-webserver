#!/bin/bash


sudo docker pull tylerlott/resume-site-frontend-react-app:prod
sudo docker stop resume-site-frontend-react-app
sudo docker image prune -f
sudo docker container prune -f
sudo docker run -d -p 3000:3000 --network resume-site-network-prod --name=resume-site-frontend-react-app tylerlott/resume-site-frontend-react-app:prod
