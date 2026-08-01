#!/usr/bin/env bash

set -e

# Homebrew
if [ ! -d "/home/linuxbrew/.linuxbrew" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Chezmoi install
if ! command -v chezmoi >/dev/null 2>&1; then
    brew install chezmoi
fi

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install --lts 

# Verify the Node.js version:
node -v 
# Verify npm version:
npm -v 

source ~/.bashrc

npm install -g typescript

#
# UV
#

if [ ! -f "$HOME/.local/bin/uv" ]; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

#
# RUSTUP
#

if [ ! -f "$HOME/.cargo/bin/rustup" ]; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

#
# OH MY ZSH
#

if [ ! -d "$HOME/.oh-my-zsh/.git" ]; then
    git clone --depth=1 \
        https://github.com/ohmyzsh/ohmyzsh.git \
        "$HOME/.oh-my-zsh"
fi

#
# POWERLEVEL10K
#

if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/.git" ]; then
  git clone --depth=1 \
  https://github.com/romkatv/powerlevel10k.git \
  "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi
#
# SET DEFAULT SHELL
#

chsh -s /usr/bin/zsh

#
# JETBRAINS MONO NERD FONT
#

mkdir -p "$HOME/.local/share/fonts"

#
# JETBRAINS MONO NERD FONT
#

if [ ! -d "$HOME/.local/share/fonts/JetBrainsMono" ]; then
    mkdir -p "$HOME/.local/share/fonts/JetBrainsMono"

    wget \
        -O /tmp/JetBrainsMono.zip \
        https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

    unzip -o /tmp/JetBrainsMono.zip \
        -d "$HOME/.local/share/fonts/JetBrainsMono"

    fc-cache -fv
fi

#
# PAPIRUS
#

if ! dpkg -s papirus-icon-theme >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y papirus-icon-theme
fi

if ! dpkg -s gnome-sushi >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y gnome-sushi
fi

# Install zsh plugins 
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/.git" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/.git" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
fi

# Install ghostty
if ! command -v ghostty >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
fi

# Install bat 
if ! command -v bat >/dev/null 2>&1 && ! command -v batcat >/dev/null 2>&1; then
    git clone https://github.com/bats-core/bats-core.git /tmp/bats-core
    cd /tmp/bats-core
    ./install.sh /usr/local
fi


npm install -g nb.sh

# Make zsh default shell 
chsh -s $(which zsh)
