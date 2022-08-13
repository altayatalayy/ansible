#!/bin/bash

# nvim files
rsync -vr ~/.config/nvim/ ./files/nvim/ --exclude=plugin --exclude=java-debug --exclude=vscode-java-test --delete

# zsh files
rsync -v ~/.zprofile ./files/zsh/

# tmux files
rsync -v ~/.tmux.conf ./files/tmux/
