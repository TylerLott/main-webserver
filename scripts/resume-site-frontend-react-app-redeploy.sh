#!bin/bash


docker pull tylerlott/resume-site-frontend-react-app:prod
docker stop resume-site-frontend-react-app
docker system prune -f
docker run -d -p 3000:3000 --network resume-site-network-prod --name=resume-site-frontend-react-app tylerlott/resume-site-frontend-react-app:prod
