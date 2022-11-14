# Sonia-Deploy

This repo contains all the script and docker compose files to to pull and/or launch the docker images on the submarines or locally.

## Docker Compose

We're using Docker Compose to start our multi-container application. The following yaml files contains the images to start on the different platforms. 

`docker-compose.auv8.yml`
`docker-compose.auv7.yml`
`docker-compose.local.yml`

## Pull

To pull the newest images on the desired platform from the docker-compose file, use one of the following command. These commands need to be run on the proper device.

`sh ./pull_auv8.sh`
`sh ./pull_auv7.sh`
`sh ./pull_local.sh`

## Launch

To launch the images on the desired platform from the docker-compose file on auv8, auv7 or locally, use one of the following command. These commands need to be run on the proper device.

`sh ./launch_auv8.sh`
`sh ./launch_auv7.sh`
`sh ./launch_local_auv7.sh`
`sh ./launch_local_auv8.sh`

## Info about the development workflow and GitFlow

Please follow the workflows described in this page : https://wiki.sonia.etsmtl.ca/en/workflow/gitflow-and-development-workflow
