echo “now executing .zprofile”
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export GOPATH=$HOME/dev/go-workspace
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="/usr/local/opt/ruby/bin:$PATH"
eval "$(rbenv init -)"
source "/Users/henrikrudstrom/dev/amedia/tools/init.zsh"

export PATH="$HOME/.cargo/bin:$PATH"

. $(brew --prefix)/etc/profile.d/z.sh
