export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export GOPATH=$HOME/dev/go-workspace
export GOROOT=/usr/local/opt/go/libexec
export GOPRIVATE=github.com/amedia
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GOPRIVATE=github.com/amedia

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

export PATH="/usr/local/opt/ruby/bin:$PATH"

source "/Users/henrikrudstrom/dev/amedia/tools/init.zsh"

source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/bin:$PATH"
