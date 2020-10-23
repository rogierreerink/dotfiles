#
# ~/.zprofile
#

# Set paths
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"

# Start xsession
[[ "$(tty)" = "/dev/tty1" ]] &&	exec startx

# Start wayland
#[[ "$(tty)" = "/dev/tty1" ]] && exec sway

