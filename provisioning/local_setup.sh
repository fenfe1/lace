#!/bin/bash

# This is a basic setup script developed mostly because i'm lazy.

# Script vars
project_dir=$1;
internal=1;  # Assume use of internal resources
internal_label=yes;

# Colour vars
Cyan='\033[0;36m'
Yellow='\033[0;33m'
Green='\033[0;32m'
NC='\033[0m'  # No colour

# Determine if internal resources are available - this test is much quicker with nmap
if hash nmap 2>/dev/null; then
	if nmap -sP --max-retries=1 --host-timeout=1500ms stash.ceh.ac.uk &> /dev/null; then
		internal=0
		internal_label=no;
	else
		internal=1
		internal_label=yes;
	fi
else
	# Fallback to ping
	if ping -c 1 stash.ceh.ac.uk &> /dev/null; then
		internal=1
		internal_label=yes;
	else
		internal=0
		internal_label=no;
	fi
fi

# Setup
printf "\n"
echo -e "${Cyan}Basic provisioning setup script${NC}"

echo -e "- project directory is: ${Yellow}${project_dir}${NC}"
echo -e "- internal resources available: ${Yellow}${internal_label}${NC}"

# Copy SSH public key
printf "\n"
echo -e "[1/2] - Copying ${Yellow}~/.ssh/id_rsa.pub${NC} to ${Yellow}${project_dir}/provisioning/public_keys/${NC}"
cp ~/.ssh/id_rsa.pub "${project_dir}/provisioning/public_keys/"
echo -e "      - ${Green}Done${NC}"

# Get ansible roles
printf "\n"
echo -e "[2/2] - Downloading ansible roles specified in ${Yellow}${project_dir}/ansible_roles.yml${NC}"

if [ ${internal} -eq 1 ]; then
	ansible-galaxy install --role-file="${project_dir}/ansible_roles.yml" --roles-path="${project_dir}/provisioning/roles" --no-deps
else
	ansible-galaxy install --role-file="${project_dir}/ansible_roles_public.yml" --roles-path="${project_dir}/provisioning/roles" --no-deps
fi

echo -e "      - ${Green}Done${NC}"

# Leaving message
printf "\n"
echo -e "${Cyan}Basic provisioning setup script${NC} - ${Green}Finished${NC}"