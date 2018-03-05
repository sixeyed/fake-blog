#!/bin/bash

docker-compose \
 -f ./docker/docker-compose.yml \
 -f ./docker/docker-compose.build.yml \
 build

date=`date +%Y%m%d`
docker image tag sixeyed/fake-blog:ghost "sixeyed/fake-blog:ghost-${date}"
docker image tag sixeyed/fake-blog:nginx "sixeyed/fake-blog:nginx-${date}"

docker image push "sixeyed/fake-blog:ghost-${date}"
docker image push "sixeyed/fake-blog:nginx-${date}"