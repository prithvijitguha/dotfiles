#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

sudo apt update

sudo apt install -y \
  curl \
  git \
  python3-pip
