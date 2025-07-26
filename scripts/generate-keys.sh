#!/bin/bash
# generate-keys.sh

environments=("test" "dev" "prod")
services=("gitlab" "runner" "webapp")

for env in "${environments[@]}"; do
  for service in "${services[@]}"; do
    dir="keys/${service}/${env}"
    mkdir -p "$dir"
    ssh-keygen -t rsa -b 4096 -f "${dir}/${service}" -N "" -C "${service}-${env}"
  done
done

