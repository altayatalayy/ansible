# Config
![example workflow](https://github.com/altayatalayy/ansible/actions/workflows/CI.yml/badge.svg)

Setup a development environment on various platforms. Ansible is used for automation.

List of programs installed:
* neovim
* git
* tmux
* zsh
* golang
* nodejs
* htop, neofetch

## Table of Contents
* [Platform Support](#platform-support)
* [Setup](#setup)
* [Launch](#launch)
* [Notes](#notes)

## Platform Support

|  MacOS  | Ubuntu 22.04 | Ubuntu 20.04 | Ubuntu 18.04 | Debian 10 | Raspberry Pi OS | Fedora | Arch Linux |
|  :---:  | :----------: | :----------: | :----------: | :-------: | :-------------: | :----: | :--------: |
|    ✅   |       ✅    |       ✅      |       ✅     |     ✅    |        :x:      |    :x:    |     :x:    |

## Setup
#### Macos
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&\
brew install git ansible &&\
ansible-galaxy collection install community.general
```
#### Ubuntu 20.04+
```bash
sudo apt install git ansible &&\
ansible-galaxy collection install community.general
```

#### Ubuntu 18.04
```bash
sudo apt install software-properties-common &&\
sudo apt-add-repository ppa:ansible/ansible &&\
sudo apt update &&\
sudo apt install git ansible &&\
ansible-galaxy collection install community.general
```

## Launch
```bash
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami)" basic.yml
```

## After Install
### Install tmux plugins
`prefix + Ctrl-I` 
  
## Notes
### nvim

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

```bash
$ copypath #copy path to clipboard
$ copyfile #copy a file to clipboard
```

### ssh setup for vms
- on guest: `sudo apt install ssh`
- on host: `ssh-copy-id -p <port> -i <sshkey> user@host`
- on host: Edit /etc/hosts
- on host: Edit ssh config 
