ZSH_DISABLE_COMPFIX=true
source ~/.zshrc.d/oh-my-zsh.zsh
source ~/.zshrc.d/aliases.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

eval $(thefuck --alias fuck)
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/henrikrudstrom/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/henrikrudstrom/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/henrikrudstrom/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/henrikrudstrom/google-cloud-sdk/completion.zsh.inc'; fi

bindkey '^X' history-incremental-search-forward

export GOPRIVATE=github.com/amedia

eval "$(starship init zsh)"
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=1
export EDITOR=vim
test -e /Users/henrikrudstrom/.iterm2_shell_integration.zsh && source /Users/henrikrudstrom/.iterm2_shell_integration.zsh || true
