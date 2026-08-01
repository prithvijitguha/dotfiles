#!/usr/bin/env bash

set -e

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# source ~/.bashrc

brew install chezmoi 

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

wget \
  -O /tmp/JetBrainsMono.zip \
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

unzip -o /tmp/JetBrainsMono.zip \
  -d "$HOME/.local/share/fonts"

fc-cache -fv

#
# PAPIRUS
#

sudo apt install -y papirus-icon-theme

sudo apt install -y gnome-sushi

git clone --depth=1 \
  https://github.com/catppuccin/papirus-folders.git \
  /tmp/papirus-folders

sudo cp -r /tmp/papirus-folders/src/* /usr/share/icons/Papirus/

# papirus-folders -C cat-mocha-mauve
