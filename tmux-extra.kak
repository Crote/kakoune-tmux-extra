define-command -hidden tmux-init-horizontal %{
  edit -scratch tmux-extra
  alias buffer terminal tmux-terminal-horizontal
  alias buffer repl tmux-repl-horizontal
}

define-command -hidden tmux-init-vertical %{
  edit -scratch tmux-extra
  alias buffer terminal tmux-terminal-vertical
  alias buffer repl tmux-repl-vertical
}

define-command -hidden tmux-init-window %{
  edit -scratch tmux-extra
  alias buffer terminal tmux-terminal-window
  alias buffer repl tmux-repl-window
}

define-command -hidden tmux-restore %{
  delete-buffer
}

hook global KakBegin .* %sh{
  if [ -n "$TMUX" ]; then
    echo "
      define-command tmux-horizontal -docstring 'Use a horizontal split as the default for \`new\` and \`repl\`' %{
        alias global terminal tmux-terminal-horizontal; alias global repl tmux-repl-horizontal
      }

      define-command tmux-vertical -docstring 'Use a vertical split as the default for \`new\` and \`repl\`' %{
        alias global terminal tmux-terminal-vertical; alias global repl tmux-repl-vertical
      }

      define-command tmux-window -docstring 'Use a new window as the default for \`new\` and \`repl\`' %{
        alias global terminal tmux-terminal-window; alias global repl tmux-repl-window
      }

      define-command newh -params 0.. -docstring '\`new\`, but with a horizontal tmux split' %{
        tmux-init-horizontal; new %arg{@}; tmux-restore
      }

      define-command newv -params 0.. -docstring '\`new\`, but with a vertical tmux split' %{
        tmux-init-vertical; new %arg{@}; tmux-restore
      }

      define-command neww -params 0.. -docstring '\`new\`, but with a new tmux window' %{
        tmux-init-window; new %arg{@}; tmux-restore
      }

      define-command replh -params 0.. -docstring '\`repl\`, but with a horizontal tmux split' %{
        tmux-init-horizontal; repl %arg{@}; tmux-restore
      }

      define-command replv -params 0.. -docstring '\`repl\`, but with a vertical tmux split' %{
        tmux-init-vertical; repl %arg{@}; tmux-restore
      }

      define-command replw -params 0.. -docstring '\`repl\`, but with a new tmux window' %{
        tmux-init-window; repl %arg{@}; tmux-restore
      }
    "
  fi
}

