#!/bin/bash
###### VARIABLES ##########
WORKING_DIR="/home/ghaniis/ans-terra/terraform/"
OUTPUT_DIR="/home/ghaniis/ans-terra/ansible/"
OUTPUT_FILE="inventory.ini"

######## LOGIC ############
# Change to working directory
cd "$WORKING_DIR"

# Create/clear the inventory file with YAML header
cat > "$OUTPUT_DIR/$OUTPUT_FILE" << 'EOL'
[webserverAL2]
EOL

# Get terraform output and format it for Ansible inventory
IP=$(terraform output -json | jq -r '.instance_public_ip.value')
echo "$IP" >> "$OUTPUT_DIR/$OUTPUT_FILE"



