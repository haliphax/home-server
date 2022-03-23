#!/bin/bash
docker-compose run --rm step-ca step ca init
echo "$(readline 'The step-ca cert password')" > /var/lib/docker/volumes/step-ca_data/_data/secrets/password
docker-compose run --rm step-ca step provider add acme --type ACME
