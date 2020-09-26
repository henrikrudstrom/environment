chflags nohidden ~/Library
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder ShowPathbar -bool true

sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
