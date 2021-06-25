#!bin/bash


docker pull tylerlott/resume-site-backend-flask-rest-api:prod
docker stop resume-site-backend-flask-rest-api
docker system prune -f
docker run -d --network resume-site-network-prod --name=resume-site-backend-flask-rest-api tylerlott/resume-site-backend-flask-rest-api:prod
