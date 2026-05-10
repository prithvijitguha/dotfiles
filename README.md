# dotfiles

Personal Linux development environment and workstation bootstrap setup using:

- [chezmoi](https://www.chezmoi.io/) for dotfile management
- [Ansible](https://www.ansible.com/) for system provisioning
- Zsh + Oh My Zsh + Powerlevel10k
- Vim / Neovim / tmux tooling
- Rust + Node.js tooling bootstrap

This repository is intended to make a fresh Ubuntu installation reproducible with minimal manual setup.

---

## Features

### Shell Environment

- Zsh
- Oh My Zsh
- Powerlevel10k
- Git aliases and shell customizations

### Editors & Terminal

- Vim
- Neovim
- vim-plug
- tmux
- TPM (Tmux Plugin Manager)

### Development Tooling

- Git
- GitHub CLI
- uv
- Rustup / Cargo
- npm

### Fonts

- JetBrains Mono Nerd Font

### Provisioning

- Ansible-based workstation bootstrap
- Idempotent setup
- Easy machine migration

---

# Repository Structure

```text
.
├── ansible/
│   ├── ansible.cfg
│   ├── bootstrap.sh
│   ├── inventory
│   ├── playbook.yml
│   ├── requirements.yml
│   └── vars.yml
├── dot_config/
├── dot_zshrc
├── dot_tmux.conf
├── dot_vimrc
└── README.md
