# dotfiles

Personal Linux development environment and workstation bootstrap setup using:

- [chezmoi](https://www.chezmoi.io/) for dotfile management
- [Ansible](https://www.ansible.com/) for system provisioning
- Zsh + Oh My Zsh + Powerlevel10k
- Vim + tmux tooling
- Rust + Node.js tooling bootstrap

This repository is intended to make a fresh Ubuntu installation reproducible with minimal manual setup.

---

## Features

### Shell Environment

- Zsh
- Oh My Zsh
- Powerlevel10k

### Editors & Terminal

- Vim
- vim-plug
- tmux
- TPM (Tmux Plugin Manager)
- Ghostty terminal configuration

### Development Tooling

- Git
- GitHub CLI
- uv
- Rustup / Cargo
- npm

### Desktop Theming

- Catppuccin GTK theme
- Papirus icon theme
- Catppuccin Papirus folders
- GTK 4.0 configuration
- Wofi launcher configuration

### Fonts

- JetBrains Mono Nerd Font

---

## Steps to Run: 

```bash
git clone https://github.com/prithvijitguha/dotfiles.git
```

Change into ansible directory
```bash
cd ansible 
```

Make it executable
```bash
chmod +x ./bootstrap.sh
```
Run the bootstrap sh script
```bash
./bootstrap.sh
```

Finally apply chezmoi config for dot files 
```bash
chezmoi init --apply prithvijitguha
```

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
├── private_dot_config/
├── dot_bashrc
├── dot_p10k.zsh
├── dot_profile
├── dot_tmux.conf
├── dot_vimrc
├── dot_zshrc
└── README.md
```
