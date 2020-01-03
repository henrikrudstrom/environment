echo “now executing .zprofile”
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export GOPATH=$HOME/Dev/go-workspace
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

eval "$(rbenv init -)"
source "/Users/henrik.rudstrom/dev/amedia/tools/init.zsh"

export PATH="$HOME/.cargo/bin:$PATH"
