#!/bin/bash
for x in portainer_data step-ca_data traefik_acme; do
	docker volume create $x
done

docker network create proxy
docker-compose run --rm step-ca step ca init
read -p 'step-ca root cert password: ' p
echo "$p" > /var/lib/docker/volumes/step-ca_data/_data/secrets/password
docker-compose run --rm step-ca step ca provisioner add localdomain --type ACME
cp /var/lib/docker/volumes/step-ca_data/_data/certs/root_ca.crt .
