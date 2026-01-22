# Primer Dark
# Auto-generated from @primer/primitives
# https://github.com/primer/primitives
#
# Installation:
#   Add to your tmux.conf:
#     source-file /path/to/extras/tmux/primer_dark.tmux
#
#   Or copy the settings below directly into your tmux.conf

# Status bar
set -g status-style "fg=#9198a1,bg=#010409"
set -g status-left "#[fg=#ffffff,bg=#1f6feb,bold] #S #[fg=#1f6feb,bg=#010409,nobold]"
set -g status-right "#[fg=#9198a1]%Y-%m-%d %H:%M "
set -g status-left-length 50
set -g status-right-length 50

# Window status
set -g window-status-format " #I:#W "
set -g window-status-current-format "#[fg=#4493f8,bg=#151b23,bold] #I:#W #[fg=#151b23,bg=#010409,nobold]"
set -g window-status-separator ""

# Pane borders
set -g pane-border-style "fg=#2f353d"
set -g pane-active-border-style "fg=#4493f8"

# Message style
set -g message-style "fg=#f0f6fc,bg=#010409"
set -g message-command-style "fg=#f0f6fc,bg=#010409"

# Mode style (copy mode, etc.)
set -g mode-style "fg=#f0f6fc,bg=#111d2e"

# Clock mode
set -g clock-mode-colour "#4493f8"

# Copy mode match highlighting
set -g copy-mode-match-style "fg=#f0f6fc,bg=#272215"
set -g copy-mode-current-match-style "fg=#ffffff,bg=#9e6a03"
