#!/bin/bash

echo "Generating Docker TLS certificate and key..."
mkdir -p /certs
openssl genrsa -out /certs/key.pem 4096
openssl req -new -x509 -sha256 -key /certs/key.pem -out /certs/cert.pem -days 365 -subj '/CN=localhost'

echo "Starting Docker..."
dockerd-rootless.sh -H ${DOCKER_HOST} --tlsverify --tlscacert=/certs/cert.pem --tlscert=/certs/cert.pem --tlskey=/certs/key.pem