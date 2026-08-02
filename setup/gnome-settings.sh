#!/bin/bash

# Center new windows in the middle of the screen
gsettings set org.gnome.mutter center-new-windows true

# Set the font face names
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 10'
gsettings set org.gnome.desktop.interface document-font-name 'JetBrainsMono Nerd Font 10'

# Reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-Blue-Dark"
THEME_COLOR="magenta"

# Turn off ambient sensors for setting screen brightness (they rarely work well!)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$THEME_COLOR-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$THEME_COLOR"
gsettings set org.gnome.desktop.interface accent-color "$THEME_COLOR" 2>/dev/null || true
# Set the background image
mkdir -p $HOME/.local/share/backgrounds
export BACKGROUND_DEST_PATH="$HOME/.local/share/backgrounds/shaded_landscape.png"
cp "./assets/shaded_landscape.png" $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-options 'zoom'
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
