#!/bin/bash

git clone --recurse-submodules git@github.com:lukasbrabenec/docker-generator.git build
cd build
docker-compose -f docker-compose-build.yml build --no-cache
docker tag build_nginx:latest lukasbrabenec/docker-generator:nginx && docker tag build_api:latest lukasbrabenec/docker-generator:api
docker push lukasbrabenec/docker-generator:nginx && docker push lukasbrabenec/docker-generator:api
docker rmi lukasbrabenec/docker-generator:nginx lukasbrabenec/docker-generator:api build_client build_nginx build_api
cd .. && rm -rf build
