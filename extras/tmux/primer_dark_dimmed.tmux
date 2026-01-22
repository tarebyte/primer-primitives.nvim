# Primer Dark Dimmed
# Auto-generated from @primer/primitives
# https://github.com/primer/primitives
#
# Installation:
#   Add to your tmux.conf:
#     source-file /path/to/extras/tmux/primer_dark_dimmed.tmux
#
#   Or copy the settings below directly into your tmux.conf

# Status bar
set -g status-style "fg=#9198a1,bg=#151b23"
set -g status-left "#[fg=#f0f6fc,bg=#316dca,bold] #S #[fg=#316dca,bg=#151b23,nobold]"
set -g status-right "#[fg=#9198a1]%Y-%m-%d %H:%M "
set -g status-left-length 50
set -g status-right-length 50

# Window status
set -g window-status-format " #I:#W "
set -g window-status-current-format "#[fg=#478be6,bg=#262c36,bold] #I:#W #[fg=#262c36,bg=#151b23,nobold]"
set -g window-status-separator ""

# Pane borders
set -g pane-border-style "fg=#353c44"
set -g pane-active-border-style "fg=#478be6"

# Message style
set -g message-style "fg=#d1d7e0,bg=#2a313c"
set -g message-command-style "fg=#d1d7e0,bg=#2a313c"

# Mode style (copy mode, etc.)
set -g mode-style "fg=#d1d7e0,bg=#243142"

# Clock mode
set -g clock-mode-colour "#478be6"

# Copy mode match highlighting
set -g copy-mode-match-style "fg=#d1d7e0,bg=#36352c"
set -g copy-mode-current-match-style "fg=#f0f6fc,bg=#966600"
