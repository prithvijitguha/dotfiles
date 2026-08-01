# dotfiles

Dotfiles for Debian setup

![Demo Screenshot](assets/dotfiles.jpeg)

## Instructions to run

[![Demo Video](https://youtu.be/3s-N7nsfI2Q)](https://youtu.be/3s-N7nsfI2Q)

```shell
chmod +x setup/* 
```

```shell
./setup/bootstrap.sh 
./setup/install-apt-packages.sh 
./setup/configure-env.sh 
./setup/gnome-extensions.sh
./setup/gnome-settings.sh
./setup/whatsapp.sh
./setup/youtube-music.sh
./setup/set-app-grid.sh
./setup/gnome-hotkeys.sh
./setup/set-dock.sh
./setup/set-workspaces.sh
```

```shell

chezmoi apply -v 

```

References: Lot of inspiration taken from the amazing Omakub Repo: [https://github.com/basecamp/omakub](https://github.com/basecamp/omakub)
