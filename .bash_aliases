#!/bin/bash

# delete all but last saved session
# open tmux
# restore the last session
alias dev='
ls -td ~/.tmux/resurrect/{*,.} | tail -n +4 | xargs -I {} rm {}
tmux new-session\; \
        run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh'

alias bye='xfce4-session-logout'
