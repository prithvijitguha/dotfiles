#!/bin/bash

mkdir -p $HOME/.local/share/application/whatsapp
mkdir -p $HOME/.local/share/whatsapp/icons

cp setup/icons/WhatsApp.png $HOME/.local/share/whatsapp/icons/WhatsApp.png

cat <<EOF >$HOME/.local/share/applications/chrome-web.whatsapp.com__-Default.desktop
[Desktop Entry]
Version=1.0
Name=WhatsApp
Comment=WhatsApp Messenger
Exec=google-chrome --app="https://web.whatsapp.com" --name=WhatsApp --class=Whatsapp
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/whatsapp/icons/WhatsApp.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
StartupWMClass=google-chrome
EOF
