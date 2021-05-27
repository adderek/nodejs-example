#!/bin/bash
set -u
set -e

containerid=$(docker ps -a --no-trunc --filter name='^/node16$' -q)
if [[ -z "${containerid}" ]] ; then
	echo "Starting container as user $(id -u -n)"
	docker run --rm -u $(id -u) -v $PWD:/home/node/src/nodejs-example --name node16 -it node:16 bash
else
	echo "Attaching terminal to container as user $(id -u -n)"
	docker exec -u $(id -u) -it node16 bash
fi
