#!/bin/bash

# nvim files
rsync -v ~/.config/nvim/profiles.lua ./files/nvim/
rsync -vr ~/.config/nvim/configs/ ./files/nvim/configs/ --exclude=plugin --delete

# tmux files
rsync -v ~/.tmux.conf ./files/tmux/
