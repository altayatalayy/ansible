# Config
> Install and configure
> * neovim
> * git
> * tmux
> * flatpak
> * UTM, virt-manager
> * ros

## Table of Contents
* [Screenshots](#screenshots)
* [Setup](#setup)
* [Project Status](#project-status)
* [Acknowledgements](#acknowledgements)
<!-- * [License](#license) -->

## Screenshots
![Example screenshot](./img/screenshot.png)
<!-- If you have screenshots you'd like to share, include them here. -->

## Setup
#### Macos
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # Install brew
brew install git ansible # Install git, ansible
```
#### Ubuntu
```
sudo apt install git ansible # Install git, ansible
```

## Launch
```
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami)"
```

## Project Status
Project is: _in progress_ 

## Acknowledgements
- This project was inspired by [this tutorial](https://www.example.com)
