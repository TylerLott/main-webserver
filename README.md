# MAIN EC2 WEBSERVER

This webserver runs on my ec2 instance and points traffic out to docker containers which contain the different microservices and websites that I'm working on. This also contains the webhooks used to redeploy the various microservices on push to their master github branch.

## Naming Convention

For websites

- (website name)-(frontend/backend/database)-(tech used)
- ex. resume-site-backend-flask-rest-api

## Port Assignment

Websites are assigned entry ports only (should point to frontend container, then that container networks to other needed containers through docker networks). Ports to be used are multiples of 1000, starting with resume-site which uses port 3000. Check nginx-sites/default and use next available.

## To add a new microservice follow the steps below:

- add the location to the nginx-sites file
  - this should be a proxy pass
  - DO NOT use root location, this is assigned to the resume site
- Add the shell script to redeploy the docker container/containers
- Add a webhook to the hooks.json file which runs the shell script
- push main-webserver to git
- Manually go to the EC2 instance and pull main-webserver git
  - sudo cp /home/ubuntu/main-webserver/nginx-sites/default /etc/nginx/sites-available/
  - sudo systemctl daemon-reload
  - sudo reload nginx
  - sudo reload webhooks
- Add autodeploy.yml to github actions for the site
- Ensure site repos have Dockerfile AND Dockerfile.prod
- Add github secrets
  - DEPLOY_WEBHOOK_URL
  - DOCKER_PASS
  - DOCKER_REPO
  - DOCKER_USER
- Push site to master
- test site to make sure live
