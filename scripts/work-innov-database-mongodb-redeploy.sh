#!/bin/bash

# PULL NEWEST DOCKER IMAGE
sudo docker pull tylerlott/work-innov-database-mongodb:prod

# STOP ALL SITE CONTAINERS
#         ** this probably doesnt need to be done with all containers, just the one
#         affected in the pull, but the frontend cannot start unless the backend is
#         running. So just to make sure the containers are all running when the front
#         starts.
sudo docker stop work-innov-backend-flask-rest-api
sudo docker stop work-innov-frontend-react-app
sudo docker stop work-innov-database-mongodb

# REMOVE ALL UNUSED CONTAINERS
sudo docker container prune -f

# START CONTAINERS
sudo docker run -d --network work-innov-network-backend-prod --name=work-innov-database-mongodb tylerlott/work-innov-database-mongodb:prod
sudo docker run -d --network work-innov-network-backend-prod --name=work-innov-backend-flask-rest-api tylerlott/work-innov-backend-flask-rest-api:prod
sudo docker connect --network=work-innov-network-frontend-prod work-innov-backend-flask-rest-api
sudo docker run -d -p 4000:3000 --network work-innov-network-frontend-prod --name=work-innov-frontend-react-app tylerlott/work-innov-frontend-react-app:prod

# REMOVE ALL UNUSED IMAGES
sudo docker image prune -f