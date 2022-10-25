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

# open gnome-calendar
alias calendar='gnome-calendar'

# open neovim
alias vim='nvim'

# turn laptop internal monitor off
alias monitoroff='xrandr --output eDP-1 --off'

# turn laptop internal monitor on
alias monitoron='xrandr --output eDP-1 --auto'
