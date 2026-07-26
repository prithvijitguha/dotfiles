#!/usr/bin/env bash

set -e

sudo apt update

sudo apt install -y git curl wget zsh tmux vim htop unzip build-essential ca-certificates software-properties-common apt-transport-https gpg flatpak snapd fonts-noto-color-emoji
