#!/bin/bash

# nvim files
rsync -vr ~/.config/nvim/ ./files/nvim/ --exclude=plugin --exclude=java-debug --exclude=vscode-java-test --delete

# tmux files
rsync -v ~/.tmux.conf ./files/tmux/
