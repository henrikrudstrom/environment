# Always copy contents of directories (r)ecursively and explain (v) what was done
alias cp='cp -rv'

# List contents with colors for file types, (A)lmost all hidden files (without . and ..), in (C)olumns, with class indicators (F)
alias ls="ls -ACFG"

# List contents with colors for file types, (a)ll hidden entries (including . and ..), use (l)ong listing format, with class indicators (F)
alias ll='ls -alFG'

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
