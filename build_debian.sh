git@github.com:heikomat/linux.git#!/bin/bash

IMAGE=linux-cx2072x-debian

docker build -t ${IMAGE} --file Dockerfile_debian .

docker rm $(docker ps -aq --filter name=${IMAGE})

docker create --name ${IMAGE} ${IMAGE}

docker cp ${IMAGE}:/root/build ../

docker rm $(docker ps -aq --filter name=${IMAGE})
