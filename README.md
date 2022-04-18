# Config
> Install and configure, see tasks/apps.yml for other apps
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
ansible-galaxy collection install community.general
```
#### Ubuntu
```
sudo apt install git ansible # Install git, ansible
ansible-galaxy collection install community.general
```

## Launch
```
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami)"
```
#### Install ros
```
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami) ros.yml"
```
#### Install ros2
```
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami) ros2.yml"
```

## Project Status
Project is: _in progress_ 

## Acknowledgements
- This project was inspired by [this tutorial](https://www.example.com)
