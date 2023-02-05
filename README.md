# Config
![example workflow](https://github.com/altayatalayy/ansible/actions/workflows/CI.yml/badge.svg)

Setup a terminal development environment on various platforms.
[Ansible](https://docs.ansible.com/ansible/latest/index.html)
<img src="https://edent.github.io/SuperTinyIcons/images/svg/ansible.svg" width="20" title="Ansible"/>
is used for automation.


## Table of Contents
* [Supported Languages](#supported-languages-and-frameworks)
* [Programs](#programs)
* [Platform Support](#platform-support)
* [Setup](#setup)
* [Launch](#launch)
* [Notes](#notes)


## Supported languages and frameworks

<table>
    <tr>
        <td>Python<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/python.svg" width="65" title="Python" /></td>
        <td>C<br><img src="https://upload.wikimedia.org/wikipedia/commons/1/18/C_Programming_Language.svg" width="65" title="C" /></td>
        <td>C++<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/cplusplus.svg" width="65" title="C++"/></td>
        <td>Rust<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/rust.svg" width="65" title="Rust" /></td>
        <td>Java<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/java.svg" width="65" title="Java" /></td>
        <td>Bash<br><img src="https://upload.wikimedia.org/wikipedia/commons/4/4b/Bash_Logo_Colored.svg" width="65" title="Bash"/></td>
        <td>Terraform<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/terraform.svg" width="65" title="Terraform"/></td>
        <td>Go<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/go.svg" width="65" title="Go" /></td>
    </tr>
    <tr>
        <td>JavaScript<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/javascript.svg" width="65" title="JavaScript" /></td>
        <td>TypeScript<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/typescript.svg" width="65" title="TypeScript"/></td>
        <td>React<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/react.svg" width="65" title="React" /></td>
        <td>HTML5<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/html5.svg" width="65" title="HTML5" /></td>
        <td>CSS3<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/css3.svg" width="65" title="CSS3"/></td>
        <td>npm<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/npm.svg" width="65" title="npm" /></td>
        <td>Yarn<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/yarn.svg" width="65" title="Yarn" /></td>
        <td>Tailwindcss<br><img src="https://upload.wikimedia.org/wikipedia/commons/d/d5/Tailwind_CSS_Logo.svg" width="65" title="Bash"/></td>
    </tr>
    <tr>
        <td>JSON<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/json.svg" width="65" title="JSON" /></td>
        <td>Markdown<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/markdown.svg" width="65" title="markdown" /></td>
    </tr>
</table>

## Programs
<table>
    <tr>
        <td>Neovim<br>
            <img src="https://upload.wikimedia.org/wikipedia/commons/3/3a/Neovim-mark.svg"  width="50" title="Neovim"/>
        </td>
        <td>Git<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/git.svg" width="80" title="git"/></td>
        <td><br>
            <img src="https://upload.wikimedia.org/wikipedia/commons/e/e4/Tmux_logo.svg"  width="50" title="tmux"/>
        </td>
    </tr>
</table>


## Platform Support
<table>
    <thead>
        <tr>
            <th>OS</th>
            <th>Version</th>
            <th>Status</th>
            <th>OS</th>
            <th>Version</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=3>Ubuntu<br>
                <img src="https://edent.github.io/SuperTinyIcons/images/svg/ubuntu.svg" width="50" title="Ubuntu" />
            </td>
            <td>22.04</td>
            <td>✅</td>
            <td rowspan=3>Debian<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/debian.svg" width="50" title="Debian"/></td>
            <td rowspan=3>10</td>
            <td rowspan=3>✅</td>
        </tr>
        <tr>
            <td>20.04</td>
            <td>✅</td>
        </tr>
        <tr>
            <td>18.04</td>
            <td>✅</td>
        </tr>
        <tr>
            <td>macOS<br>
                <img src="https://edent.github.io/SuperTinyIcons/images/svg/macos.svg" width="50" title="macOS"/>
            </td>
            <td>Ventura</td>
            <td>✅</td>
            <td>Raspberry Pi<br>
                <img src="https://edent.github.io/SuperTinyIcons/images/svg/raspberry_pi.svg" width="50" title="Raspberry Pi" />
            </td>
            <td>Raspberry Pi OS (64-bit)</td>
            <td>❌</td>
        </tr>
        <tr>
            <td>Fedora<br>
                <img src="https://upload.wikimedia.org/wikipedia/commons/3/3f/Fedora_logo.svg" width="50" title="Fedora" />
            </td>
            <td></td>
            <td>❌</td>
            <td>Arch Linux<br>
                <img src="https://edent.github.io/SuperTinyIcons/images/svg/arch_linux.svg" width="50" title="Arch Linux"/>
            </td>
            <td></td>
            <td>❌</td>
        </tr>
    </tbody>
</table>

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
