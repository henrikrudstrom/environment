OVERWRITE=$1
link_file() {
    if [ $OVERWRITE -gt 0 ]; then
        rm -v "$2"

    fi
    ln -h "$1" "$2"
}

link_folder() {

    if [ $OVERWRITE -gt 0 ]; then
        rm -rv "$2$1"
    fi
    ln -s "$(pwd)/$1" "$2"
}

link_file settings.json ~/Library/Application\ Support/Code/User/settings.json
link_file keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
link_folder snippets/ ~/Library/Application\ Support/Code/User/
link_folder .hammerspoon ~/
link_file .tigrc ~/.tigrc
link_file .zprofile ~/.zprofile
link_file .zshrc ~/.zshrc
link_folder .zshrc.d ~/
link_file .gitconfig ~/.gitconfig
rm -v ~/.config/karabiner/karabiner.json
cp -v karabiner.json ~/.config/karabiner/karabiner.json
