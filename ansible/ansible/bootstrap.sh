#!/usr/bin/env bash

set -e

sudo apt update

sudo apt install -y \
    ansible \
    software-properties-common \
    curl \
    git \
    python3-pip

ansible-galaxy collection install -r requirements.yml

ansible-playbook playbook.yml -K
