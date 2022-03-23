#!/bin/bash
for x in portainer_data step-ca_data traefik_acme; do
	docker volume create $x
done

docker network create proxy
