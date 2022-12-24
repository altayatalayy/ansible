# Config
![example workflow](https://github.com/altayatalayy/ansible/actions/workflows/CI.yml/badge.svg)

Install and configure
* neovim
* git
* tmux
* zsh
* flatpak
* UTM, virt-manager
* ros

## Table of Contents
* [Platform Support](#platform-support)
* [Setup](#setup)
* [Launch](#launch)
* [Notes](#notes)
* [Project Status](#project-status)
* [Acknowledgements](#acknowledgements)
<!-- * [License](#license) -->

## Platform Support

|  MacOS  | Ubuntu 22.04 | Ubuntu 20.04 | Ubuntu 18.04 | Debian 10 | Raspberry Pi OS | Fedora 36 | Arch Linux |
|  :---:  | :----------: | :----------: | :----------: | :-------: | :-------------: | :-------: | :--------: |
|    ✅   |       ✅    |       ✅      |       ✅     |     ✅    |        ✅       |    :x:    |     :x:    |

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
```
nvim -c +PackerSync +qa
``` 
  
## Notes
### nvim
#### Keymapings
- `<leader>` = Space
- `s` - HopChar1
- `sw` - HopWord
- `gcc` - Toggles the current line using linewise comment
- `gbc` - Toggles the current line using blockwise comment
- `z-c` - fold
- `z-o` - open fold
- `<C-p>` - MarkdownPreviewToggle


### tmux
- `Ctrl-a` - prefix
- `prefix + R` - Reload configuration file
- `prefix + |` - Vertical split
- `prefix + -` - Horizontal split
- `prefix + m` - Toggle mouse mode 
- `prefix + Ctrl-s` - save
- `prefix + Ctrl-r` - restore

### zsh

```
$ copypath #copy path to clipboard
$ copyfile #copy a file to clipboard
```

### ssh setup for vms
- on guest: `sudo apt install ssh`
- on host: `ssh-copy-id -p <port> -i <sshkey> user@host`
- on host: Edit /etc/hosts
- on host: Edit ssh config 


## Project Status
Project is: _in progress_ 

## Acknowledgements
- This project was inspired by [this tutorial](https://www.example.com)
