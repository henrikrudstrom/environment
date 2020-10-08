code --list-extensions | xargs -L 1 echo code --install-extension >04-install-extensions.sh
chmod +x 04-install-extensions.sh

rm Brewfile

brew bundle dump
