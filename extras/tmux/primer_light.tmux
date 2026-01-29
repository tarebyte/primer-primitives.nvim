# Primer Light
# Auto-generated from @primer/primitives
# https://github.com/primer/primitives
#
# Installation:
#   Add to your tmux.conf:
#     source-file /path/to/extras/tmux/primer_light.tmux
#
#   Or copy the settings below directly into your tmux.conf

# Status bar
set -g status-style "fg=#59636e,bg=#ffffff"
set -g status-left "#[fg=#8250df,bold] #S #[fg=#59636e,nobold]"
set -g status-right "#[fg=#59636e]%Y-%m-%d %H:%M "
set -g status-left-length 50
set -g status-right-length 50

# Window status
set -g window-status-format "#[fg=#818b98] #I:#W "
set -g window-status-current-format "#[fg=#1f2328,bold] #I:#W #[nobold]"
set -g window-status-separator ""

# Pane borders
set -g pane-border-style "fg=#dfe4e9"
set -g pane-active-border-style "fg=#818b98"

# Message style
set -g message-style "fg=#1f2328,bg=#ffffff"
set -g message-command-style "fg=#1f2328,bg=#ffffff"

# Mode style (copy mode, etc.)
set -g mode-style "fg=#1f2328,bg=#ddf4ff"

# Clock mode
set -g clock-mode-colour "#59636e"

# Copy mode match highlighting
set -g copy-mode-match-style "fg=#1f2328,bg=#fff8c5"
set -g copy-mode-current-match-style "fg=#ffffff,bg=#9a6700"
