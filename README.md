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
<!-- * [License](#license) -->

## Platform Support

|  MacOS  | Ubuntu 22.04 | Ubuntu 20.04 | Ubuntu 18.04 | Debian 10 | Raspberry Pi OS | Fedora | Arch Linux |
|  :---:  | :----------: | :----------: | :----------: | :-------: | :-------------: | :----: | :--------: |
|    ✅   |       ✅    |       ✅      |       ✅     |     ✅    |        ✅       |    :x:    |     :x:    |

## Setup
#### Macos
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git ansible
ansible-galaxy collection install community.general
```
#### Ubuntu
```bash
sudo apt install git ansible
ansible-galaxy collection install community.general
```

## Launch
```bash
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami)" basic.yml
```
#### Install ros
```bash
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami)" ros.yml
```
#### Install ros2
```bash
sudo ansible-pull -U https://github.com/altayatalayy/ansible.git -e "user_name=$(whoami)" ros2.yml
```

## After Install
```bash
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
``` 
  
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
