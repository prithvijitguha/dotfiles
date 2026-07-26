#!/usr/bin/env bash

set -e

#
# CHEZMOI
#

sudo snap install chezmoi --classic

#
# NODE.JS + NPM
#

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.6/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v # Should print "v24.18.0".

# Verify npm version:
npm -v # Should print "11.16.0".

#
# GITHUB CLI
#

if [ ! -f /usr/bin/gh ]; then
  (type -p wget >/dev/null || (sudo apt update && sudo apt install -y wget))
  sudo mkdir -p -m 755 /etc/apt/keyrings

  out=$(mktemp)

  wget -nv -O "$out" https://cli.github.com/packages/githubcli-archive-keyring.gpg

  cat "$out" | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null

  sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg

  sudo mkdir -p -m 755 /etc/apt/sources.list.d

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" |
    sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

  sudo apt update
  sudo apt install -y gh
fi

#
# NPM GLOBALS
#

sudo npm install -g typescript

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

git clone --depth=1 \
  https://github.com/ohmyzsh/ohmyzsh.git \
  "$HOME/.oh-my-zsh"

#
# POWERLEVEL10K
#

git clone --depth=1 \
  https://github.com/romkatv/powerlevel10k.git \
  "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

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

sudo apt install -y flameshot

git clone --depth=1 \
  https://github.com/catppuccin/papirus-folders.git \
  /tmp/papirus-folders

sudo cp -r /tmp/papirus-folders/src/* /usr/share/icons/Papirus/

papirus-folders -C cat-mocha-mauve

#
# GTK
#

gsettings set org.gnome.desktop.interface \
  gtk-theme "Catppuccin-Mocha-Standard-Blue-Dark"

gsettings set org.gnome.desktop.interface \
  icon-theme "Papirus-Dark"

gsettings set org.gnome.desktop.interface \
  color-scheme prefer-dark

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum
