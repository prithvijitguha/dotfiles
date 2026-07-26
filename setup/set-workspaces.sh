#!/bin/bash
# ------------------------------------------------------------------------------
# Workspace assignments (Auto Move Windows)
#
# Workspace 1 : Programming -> Ghostty
# Workspace 2 : Browser    -> Firefox
# Workspace 3 : Gaming     -> Steam
# Workspace 4 : Media      -> Stremio
# Workspace 5 : Reserved
# Workspace 6 : Reserved
# ------------------------------------------------------------------------------

gsettings set org.gnome.shell.extensions.auto-move-windows application-list \
  "[
'ghostty_ghostty.desktop:1',
'firefox_firefox.desktop:2',
'steam.desktop:3',
'com.stremio.Stremio.desktop:4'
]"
