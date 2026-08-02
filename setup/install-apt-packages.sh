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
sudo apt install -y apt-transport-https
sudo apt install -y gpg
sudo apt install -y flatpak
sudo apt install -y fonts-noto-color-emoji
sudo apt install -y flameshot
sudo apt install -y fd-find
sudo apt install -y fzf
sudo apt install -y gpg
sudo apt install -y pipx
sudo apt install -y gir1.2-gnomedesktop-4.0
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y steam
# Install eza
if ! command -v eza >/dev/null 2>&1; then
  sudo mkdir -p /etc/apt/keyrings

  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc |
    sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg

  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" |
    sudo tee /etc/apt/sources.list.d/gierens.list

  sudo chmod 644 \
    /etc/apt/keyrings/gierens.gpg \
    /etc/apt/sources.list.d/gierens.list
fi
# Stremio
sudo apt update
sudo apt install -y flatpak

# Install signal
# 1. Install our official public software signing key:
curl https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor >signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg >/dev/null

# 2. Add our repository to your list of repositories:
curl -o signal-desktop.sources https://updates.signal.org/static/desktop/apt/signal-desktop.sources
cat signal-desktop.sources | sudo tee /etc/apt/sources.list.d/signal-desktop.sources >/dev/null

# 3. Update your package database and install Signal:
sudo apt update && sudo apt install signal-desktop

flatpak remote-add --if-not-exists flathub \
  https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub com.stremio.Stremio
