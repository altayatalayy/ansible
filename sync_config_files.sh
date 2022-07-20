#!/bin/bash

rsync -vr ~/.config/nvim/ ./files/nvim/ --exclude=plugin --delete
