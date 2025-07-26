#!/bin/bash

# Variables
keys_dir="../keys/"
environments=("test" "dev" "prod")
services=("gitlab" "runner" "webapp")

# Start SSH agent 
eval "$(ssh-agent -k)"
eval "$(ssh-agent -s)"

for env in ${environments[@]}; do 
  for service in ${services[@]}; do
    key_path="${keys_dir}/${service}/${env}/${service}"
    # Check if key exists
    if [ -f "$key_path" ]; then
      echo "Adding key for ${service} in ${env} environment"
      ssh-add "$key_path"
    else
      echo "Warning: Key not found at $key_path"
    fi
  done
done

# add keys to agent 
echo "Keys added to SSH agent:"
ssh-add -l

# Export ENVs from script 
echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK"
echo "export SSH_AGENT_PID=$SSH_AGENT_PID"


