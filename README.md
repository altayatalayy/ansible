# Config
![example workflow](https://github.com/altayatalayy/ansible/actions/workflows/CI.yml/badge.svg)

Install and configure, see tasks/apps.yml for other apps
* neovim
* git
* tmux
* flatpak
* UTM, virt-manager
* ros

## Table of Contents
* [Setup](#setup)
* [Project Status](#project-status)
* [Acknowledgements](#acknowledgements)
<!-- * [License](#license) -->

## Setup
#### Macos
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # Install brew
brew install git ansible # Install git, ansible
ansible-galaxy install -r requirements.yml
```
#### Ubuntu
```
sudo apt install git ansible # Install git, ansible
ansible-galaxy install -r requirements.yml
```

## Launch
```
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami)" basic.yml
```
#### Install ros
```
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami)" ros.yml
```
#### Install ros2
```
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami)" ros2.yml
```

## After Install
### neovim
- run PlugInstall in neovim
  
## Notes
### tmux
prefix = C-a

Reload configuration file: prefix-r

splits: prefix-| prefix--

Toggle mouse mode: prefix-m

Save: prefix-C-s

Restore: prefic-C-r

plugins:

https://github.com/tmux-plugins/tpm

https://github.com/tmux-plugins/tmux-sensible 

https://github.com/tmux-plugins/tmux-resurrect

https://github.com/tmux-plugins/tmux-continuum
  
 
### zsh

copy path to clipboard: copypath

copy a file to clipboard copyfile

### ssh setup for vms
- on guest: sudo apt install ssh
- on host: Edit /etc/hosts
- on host: Edit ssh config 
- on host: ssh-copy-id -p <port> -i <sshkey> user@host


## Project Status
Project is: _in progress_ 

## Acknowledgements
- This project was inspired by [this tutorial](https://www.example.com)
