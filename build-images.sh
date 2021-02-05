#!/bin/bash

git clone --recurse-submodules git@github.com:lukasbrabenec/docker-generator.git build
cd build
docker-compose -f docker-compose-build.yml build
docker tag build_nginx:latest lukasbrabenec/docker-generator:nginx && docker tag build_api:latest lukasbrabenec/docker-generator:api
docker push lukasbrabenec/docker-generator:nginx && docker push lukasbrabenec/docker-generator:api
cd .. && rm -rf build
