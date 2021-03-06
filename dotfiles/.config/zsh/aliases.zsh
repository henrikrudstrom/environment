# Always copy contents of directories (r)ecursively and explain (v) what was done
alias cp='cp -rv'

# List contents with colors for file types, (A)lmost all hidden files (without . and ..), in (C)olumns, with class indicators (F)

alias ls="exa --color=always -Fa"
alias ll="exa --color=always -Fla"
alias llfu='exa -bghlSa --git'
alias lll="ll | less"
alias lt="exa --color=always -FTa --level 2"

alias lt1="exa --color=always -FTa --level 1"
alias lt2="exa --color=always -FTa --level 2"
alias lt3="exa --color=always -FTa --level 3"
alias lt4="exa --color=always -FTa --level 4"
# Explain (v) what was done when moving a file
alias mv='mv -v'

# Create any non-existent (p)arent directories and explain (v) what was done
alias mkdir='mkdir -pv'

# Always try to (c)ontinue getting a partially-downloaded file
alias wget='wget -c'

alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias hst='history | grep'

alias cd..='cd ..'

alias aliase='vim ~/dev/henrikrudstrom/environment/.zshrc.d/aliases.zsh'
alias reload="source ~/.zshrc"
alias ecl=edit-command-line

## tmux aliases
alias tmux="tmux -f .config/tmux/tmux.conf"
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias there="tmux-here"
alias tgit="tmux-gitroot"

alias clr="clear"

## Kubernetes
alias k=kubectl
alias kgp="k get pods"
alias kl="k logs -f"

## git
# alias git='git -c .config/gitconfig'
alias g='git'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpf='git pushf'
alias gc='git commit'
alias gco='git checkout'

alias top='htop'
alias vi="nvim"
alias vim="nvim"

alias mk="minikube kubectl --"
