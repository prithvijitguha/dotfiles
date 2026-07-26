#!/usr/bin/env bash

sudo apt install gnome-shell-extension-manager
sudo apt install -y \
  gnome-shell-extension-appindicator \
  gnome-shell-extension-desktop-icons-ng \
  gnome-shell-extension-tiling-assistant \
  gnome-shell-extension-ubuntu-dock

gnome-extensions enable blur-my-shell@aunetx
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable just-perfection-desktop@just-perfection
gnome-extensions enable rounded-window-corners@fxgn
gnome-extensions enable tilingshell@ferrarodomenico.com
gnome-extensions enable ding@rastersoft.com

gsettings set org.gnome.shell.extensions.tilingshell cycle-layouts "['<Control><Super>Right']"
gsettings set org.gnome.shell.extensions.tilingshell cycle-layouts-backward "['<Shift><Control><Super>Right']"
gsettings set org.gnome.shell.extensions.tilingshell edge-tiling-mode 'default'
gsettings set org.gnome.shell.extensions.tilingshell quarter-tiling-threshold 50
gsettings set org.gnome.shell.extensions.tilingshell selected-layouts "[['Layout 2', 'Layout 1'], ['Layout 2', 'Layout 1']]"
gsettings set org.gnome.shell.extensions.tilingshell snap-assist-sync-layout false
