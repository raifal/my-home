#!/bin/bash

. ./setup_dev_env.sh

docker-compose down

pushd ./my-home-backend
mvn clean install -DskipTests=true
popd

pushd ./my-home-web
ng build --prod
popd

docker-compose up -d
