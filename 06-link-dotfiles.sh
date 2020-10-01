mkdir -p $HOME/.config
mkdir -p $HOME/nvim

stow --target $HOME --restow dotfiles

stow --target ~/Library/Application\ Support/Code/User/ vscode-settings
