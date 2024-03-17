Dev-Env-Automator: Your Next Dev Environment, One Click Away

![example workflow](https://github.com/altayatalayy/ansible/actions/workflows/CI.yml/badge.svg)

Setup a terminal development environment on various platforms.



## Supported languages and frameworks

<table style="table-layout: fixed; width: 700px; margin: auto;">
    <tr>
        <td width="100" style="text-align: center" >Python<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/python.svg" width="30" title="Python" /></td>
        <td width="100" style="text-align: center" >C<br><img src="https://upload.wikimedia.org/wikipedia/commons/1/18/C_Programming_Language.svg" width="30" title="C" /></td>
        <td width="100" style="text-align: center" >C++<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/cplusplus.svg" width="30" title="C++"/></td>
        <td width="100" style="text-align: center" >Rust<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/rust.svg" width="30" title="Rust" /></td>
        <td width="100" style="text-align: center" >Java<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/java.svg" width="30" title="Java" /></td>
        <td width="100" style="text-align: center" >Bash<br><img src="https://upload.wikimedia.org/wikipedia/commons/4/4b/Bash_Logo_Colored.svg" width="30" title="Bash"/></td>
        <td width="100" style="text-align: center" >Go<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/go.svg" width="30" title="Go" /></td>
    </tr>
    <tr>
        <td width="100" style="text-align: center" >JavaScript<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/javascript.svg" width="30" title="JavaScript" /></td>
        <td width="100" style="text-align: center" >React<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/react.svg" width="30" title="React" /></td>
        <td width="100" style="text-align: center" >TypeScript<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/typescript.svg" width="30" title="TypeScript"/></td>
        <td width="100" style="text-align: center" >HTML5<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/html5.svg" width="30" title="HTML5" /></td>
        <td width="100" style="text-align: center" >CSS3<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/css3.svg" width="30" title="CSS3"/></td>
        <td width="100" style="text-align: center" >npm<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/npm.svg" width="30" title="npm" /></td>
        <td width="100" style="text-align: center" >Yarn<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/yarn.svg" width="30" title="Yarn" /></td>
    </tr>
    <tr>
        <td width="100" style="text-align: center" >Markdown<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/markdown.svg" width="30" title="markdown" /></td>
        <td width="100" style="text-align: center" >JSON<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/json.svg" width="30" title="JSON" /></td>
        <td width="100" style="text-align: center" >Tailwindcss<br><img src="https://upload.wikimedia.org/wikipedia/commons/d/d5/Tailwind_CSS_Logo.svg" width="30" title="Bash"/></td>
        <td width="100" style="text-align: center" >Terraform<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/terraform.svg" width="30" title="Terraform"/></td>
    </tr>
</table>

## Platform Support
<table style="table-layout: fixed; width: 90%; margin: auto; text-align: center; ">
    <thead>
        <tr>
            <th width="15%">OS</th>
            <th width="15%">Version</th>
            <th width="15%">Status</th>
            <th width="15%">OS</th>
            <th width="15%">Version</th>
            <th width="15%">Status</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=3 style="vertical-align: middle;">Ubuntu<br>
                <img src="https://edent.github.io/SuperTinyIcons/images/svg/ubuntu.svg" width="50" title="Ubuntu" />
            </td>
            <td>22.04</td>
            <td>✅</td>
            <td rowspan=3 style="vertical-align: middle;">Debian<br><img src="https://edent.github.io/SuperTinyIcons/images/svg/debian.svg" width="50" title="Debian"/></td>
            <td rowspan=3 style="vertical-align: middle;">10</td>
            <td rowspan=3 style="vertical-align: middle;">✅</td>
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
            <td style="vertical-align: middle;">Ventura</td>
            <td>✅</td>
            <td>Raspberry Pi<br>
                <img src="https://edent.github.io/SuperTinyIcons/images/svg/raspberry_pi.svg" width="50" title="Raspberry Pi" />
            </td>
            <td style="vertical-align: middle;">Pi OS (64-bit)</td>
            <td style="vertical-align: middle;">❌</td>
        </tr>
        <tr>
            <td>Fedora<br>
                <img src="https://upload.wikimedia.org/wikipedia/commons/3/3f/Fedora_logo.svg" width="50" title="Fedora" />
            </td>
            <td></td>
            <td style="vertical-align: middle;">❌</td>
            <td>Arch Linux<br>
                <img src="https://edent.github.io/SuperTinyIcons/images/svg/arch_linux.svg" width="50" title="Arch Linux"/>
            </td>
            <td></td>
            <td style="vertical-align: middle;">❌</td>
        </tr>
    </tbody>
</table>

## Setup
#### Macos
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
brew install git ansible && \
ansible-galaxy collection install community.general
```

#### Ubuntu
```bash
sudo apt update && \
sudo apt install -y python3 python3-pip python3-venv && \
python3 -m venv venv && \
source venv/bin/activate && \
pip install ansible && \
ansible-galaxy collection install community.general && \
deactivate
```

#### Ubuntu (as root)
```bash
apt update && \
apt install -y python3 python3-pip python3-venv && \
python3 -m venv venv && \
source venv/bin/activate && \
pip install ansible && \
ansible-galaxy collection install community.general && \
deactivate
```

## Launch

```bash
ANSIBLE_FORCE_COLOR=True ansible-pull -i localhost,"$(hostname)" -U https://github.com/altayatalayy/ansible.git -d ~/.dev-env-automator basic.yml
```

```bash
ANSIBLE_FORCE_COLOR=True ansible-pull -i localhost,"$(hostname)" -U file:///~/.dev-env-automator basic.yml
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
