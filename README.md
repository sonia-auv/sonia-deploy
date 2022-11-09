# Sonia-Deploy

This repo contains all the script and docker compose files to to pull and/or launch the docker images on the submarines or locally.

## Docker Compose

We're using Docker Compose to start our multi-container application. The following 

## Pull

To pull the newest images on the desired platform from the docker-compose file, use one of the following command:

`sh ./pull_auv8.sh`
`sh ./pull_auv7.sh`
`sh ./pull_local.sh`

## Launch

To launch the images on the desired platform from the docker-compose file on the submarine or locally, use one of the following command:

`sh ./launch_auv8.sh`
`sh ./launch_auv7.sh`
`sh ./launch_local_auv7.sh`
`sh ./launch_local_auv8.sh`

## Info about the development workflow and GitFlow

Please follow the workflows described in this page : https://wiki.sonia.etsmtl.ca/en/workflow/gitflow-and-development-workflow
