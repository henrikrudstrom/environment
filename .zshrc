ZSH_DISABLE_COMPFIX=true
source ~/.zshrc.d/oh-my-zsh.zsh
source ~/.zshrc.d/aliases.zsh

eval $(thefuck --alias fuck)
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/henrikrudstrom/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/henrikrudstrom/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/henrikrudstrom/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/henrikrudstrom/google-cloud-sdk/completion.zsh.inc'; fi

bindkey '^X' history-incremental-search-forward

eval "$(starship init zsh)"
