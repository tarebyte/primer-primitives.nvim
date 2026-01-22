# Primer Dark High Contrast
# Auto-generated from @primer/primitives
# https://github.com/primer/primitives
#
# Installation:
#   Add to your tmux.conf:
#     source-file /path/to/extras/tmux/primer_dark_high_contrast.tmux
#
#   Or copy the settings below directly into your tmux.conf

# Status bar
set -g status-style "fg=#b7bdc8,bg=#010409"
set -g status-left "#[fg=#ffffff,bg=#194fb1,bold] #S #[fg=#194fb1,bg=#010409,nobold]"
set -g status-right "#[fg=#b7bdc8]%Y-%m-%d %H:%M "
set -g status-left-length 50
set -g status-right-length 50

# Window status
set -g window-status-format " #I:#W "
set -g window-status-current-format "#[fg=#74b9ff,bg=#151b23,bold] #I:#W #[fg=#151b23,bg=#010409,nobold]"
set -g window-status-separator ""

# Pane borders
set -g pane-border-style "fg=#b7bdc8"
set -g pane-active-border-style "fg=#74b9ff"

# Message style
set -g message-style "fg=#ffffff,bg=#010409"
set -g message-command-style "fg=#ffffff,bg=#010409"

# Mode style (copy mode, etc.)
set -g mode-style "fg=#ffffff,bg=#0a1522"

# Clock mode
set -g clock-mode-colour "#74b9ff"

# Copy mode match highlighting
set -g copy-mode-match-style "fg=#ffffff,bg=#241d0d"
set -g copy-mode-current-match-style "fg=#ffffff,bg=#7b4900"
