# Permanently set ~/.bin to the PATH.
# i3 will only check this here, not in .bashrc
[[ -d $HOME/.bin ]] && export PATH=$HOME/.bin:$PATH
. "$HOME/.cargo/env"

# Activate capslock remap
setxkbmap -layout us -variant intl -option ctrl:swapcaps
