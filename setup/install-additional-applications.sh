#!/usr/bin/env bash

set -e

# Homebrew
if [ ! -d "/home/linuxbrew/.linuxbrew" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Chezmoi install
if ! command -v chezmoi >/dev/null 2>&1; then
  brew install chezmoi
fi

# Download and install Node.js:
if ! command -v node >/dev/null 2>&1; then
  brew install node@24
  # Verify the Node.js version:
  node -v # Should print "v24.18.1".
  # Verify npm version:
  npm -v # Should print "11.16.0".
fi

if ! npm list -g typescript >/dev/null 2>&1; then
  npm install -g typescript
fi

# UV
if [ ! -f "$HOME/.local/bin/uv" ]; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# RUSTUP
if [ ! -f "$HOME/.cargo/bin/rustup" ]; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

# OH MY ZSH
if [ ! -d "$HOME/.oh-my-zsh/.git" ]; then
  git clone --depth=1 \
    https://github.com/ohmyzsh/ohmyzsh.git \
    "$HOME/.oh-my-zsh"
fi

# POWERLEVEL10K
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/.git" ]; then
  git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi

# JETBRAINS MONO NERD FONT
if [ ! -d "$HOME/.local/share/fonts/JetBrainsMono" ]; then
  mkdir -p "$HOME/.local/share/fonts/JetBrainsMono"

  wget \
    -O /tmp/JetBrainsMono.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

  unzip -o /tmp/JetBrainsMono.zip \
    -d "$HOME/.local/share/fonts/JetBrainsMono"

  fc-cache -fv
fi

# PAPIRUS
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

if ! command -v nb >/dev/null 2>&1; then
  npm install -g nb.sh
fi

# Google Chrome
if ! command -v google-chrome >/dev/null 2>&1; then
  wget -q -O /tmp/google-chrome.deb \
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

  sudo apt install -y /tmp/google-chrome.deb

  rm -f /tmp/google-chrome.deb
fi

# Hunk CLI
if ! command -v hunk >/dev/null 2>&1; then
  brew install hunk
  # Install hunk for page diff for git
  git config --global core.pager "hunk pager"
fi

# Make zsh default shell
chsh -s $(which zsh)
