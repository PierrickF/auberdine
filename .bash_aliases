#!/bin/bash

# delete all but last saved session
# open tmux
# restore the last session
alias dev='
ls -td ~/.tmux/resurrect/{*,.} | tail -n +4 | xargs -I {} rm {}
tmux new-session\; \
        run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh'

# i3 session logout
alias bye='i3-msg exit'

# rust book offline
alias rustbook='rustup doc --book'

# open neovim
alias vim='nvim'

# fix for alacritty-ssh compatibility issues
alias ssh='TERM=xterm-256color ssh'
