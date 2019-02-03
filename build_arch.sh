#!/bin/bash

IMAGE=linux-cx2072x-archlinux

docker build -t ${IMAGE} --file Dockerfile_arch .

docker rm $(docker ps -aq --filter name=${IMAGE})

docker create --name ${IMAGE} ${IMAGE}

docker cp ${IMAGE}:/home/nonroot/package ./arch_package/

docker rm $(docker ps -aq --filter name=${IMAGE})
