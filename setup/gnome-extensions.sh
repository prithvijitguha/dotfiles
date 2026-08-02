#!/usr/bin/env bash

sudo apt install gnome-shell-extension-manager

sudo apt install -y gnome-shell-extension-manager gir1.2-gtop-2.0 gir1.2-clutter-1.0
pipx install gnome-extensions-cli --system-site-packages

# Turn off default Ubuntu extensions
gnome-extensions disable ding@rastersoft.com
# Pause to assure user is ready to accept confirmations
read -rp "Press Enter to install GNOME extensions..."

# Install new extensions
gext install tactile@lundal.io
gext install just-perfection-desktop@just-perfection
gext install blur-my-shell@aunetx
gext install space-bar@luchrioh
gext install undecorate@sun.wxg@gmail.com
gext install tophat@fflewddur.github.io
gext install AlphabeticalAppGrid@stuarthayhurst
gext install auto-move-windows@gnome-shell-extensions.gcampax.github.com
gext install workspace-indicator@gnome-shell-extensions.gcampax.github.com
gext install dash-to-dock@micxgx.gmail.com
gext install rounded-window-corners@fxgn
gext install tilingshell@ferrarodomenico.com
gext install ding@rastersoft.com

gnome-extensions enable tactile@lundal.io
gnome-extensions enable just-perfection-desktop@just-perfection
gnome-extensions enable blur-my-shell@aunetx
gnome-extensions enable space-bar@luchrioh
gnome-extensions enable undecorate@sun.wxg@gmail.com
gnome-extensions enable tophat@fflewddur.github.io
gnome-extensions enable AlphabeticalAppGrid@stuarthayhurst
gnome-extensions enable auto-move-windows@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable workspace-indicator@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable rounded-window-corners@fxgn
gnome-extensions enable tilingshell@ferrarodomenico.com
gnome-extensions enable ding@rastersoft.com

# Compile gsettings schemas
sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/auto-move-windows@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.auto-move-windows.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/workspace-indicator@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.workspace-indicator.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/rounded-window-corners@fxgn/schemas/org.gnome.shell.extensions.rounded-window-corners-reborn.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com/schemas/org.gnome.shell.extensions.tilingshell.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Tactile
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 2
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 0
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 32

# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection animation 2
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection workspace true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false

# Configure Blur My Shell
gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat show-icons false
gsettings set org.gnome.shell.extensions.tophat show-cpu true
gsettings set org.gnome.shell.extensions.tophat show-disk false
gsettings set org.gnome.shell.extensions.tophat show-mem true
gsettings set org.gnome.shell.extensions.tophat show-fs false
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bytes
gsettings set org.gnome.shell.extensions.tophat meter-fg-color "#e920a3"
# Configure AlphabeticalAppGrid
gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'
