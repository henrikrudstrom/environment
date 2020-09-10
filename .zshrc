source ~/.zshrc.d/oh-my-zsh.zsh
source ~/.zshrc.d/init.zsh
source ~/.zshrc.d/aliases.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="/usr/local/opt/ruby/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/henrikrudstrom/y/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/henrikrudstrom/y/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/henrikrudstrom/y/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/henrikrudstrom/y/google-cloud-sdk/completion.zsh.inc'; fi
