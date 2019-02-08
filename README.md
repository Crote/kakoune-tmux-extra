# kakoune-tmux-extra
Extra helper functions to make Kakoune easier to use inside Tmux

# Functions available
## `newh`, `newv`, `neww`
Behaves exactly like `new`, but acts in a horizontal split, vertical split, or a new window.

## `replh`, `replv`, `replw`
Behaves exactly like `repl`, but acts in a horizontal split, vertical split, or a new window.

## `tmux-horizontal`, `tmux-vertical`, `tmux-window`
Sets the default behaviour for `new` and `repl` to a horizontal split, vertical split, or a new window.
