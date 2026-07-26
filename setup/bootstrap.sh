#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

sudo apt update

sudo apt install -y \
  software-properties-common \
  curl \
  git \
  python3-pip
