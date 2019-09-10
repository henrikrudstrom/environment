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
alias hs='history | grep'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias aliase='vim ~/Dev/env/environment/.zshrc.d/aliases.zshrc'
