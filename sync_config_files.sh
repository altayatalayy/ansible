#!/bin/bash

# nvim files
rsync -vr ~/.config/nvim/ ./files/nvim/ --exclude=plugin --delete

# tmux files
rsync -v ~/.tmux.conf ./files/tmux/
