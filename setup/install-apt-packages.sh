#!/usr/bin/env bash

set -e

sudo apt update

sudo apt install -y git
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y zsh
sudo apt install -y tmux
sudo apt install -y vim
sudo apt install -y htop
sudo apt install -y unzip
sudo apt install -y build-essential
sudo apt install -y ca-certificates
sudo apt install -y software-properties-common
sudo apt install -y apt-transport-https
sudo apt install -y gpg
sudo apt install -y flatpak
sudo apt install -y snapd
sudo apt install -y fonts-noto-color-emoji
sudo apt install -y flameshot
sudo apt install -y chezmoi
sudo apt install -y bat
sudo apt install -y fd-find
sudo apt install -y fzf

curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update && sudo apt-get install spotify-client
