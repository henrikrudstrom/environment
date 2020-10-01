echo "Install keyboard layous"
mkdir -p "/Users/henrikrudstrom/Library/Keyboard Layouts"
cp -r "Norwegian No Dead Keys.bundle" "/Users/henrikrudstrom/Library/Keyboard Layouts/"

echo "Installing zinit"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

echo "Installing tmux package manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

nvm use 12.10.0

echo "Installing global node packages"
npm install -g npkill
npm install -g speed-test
npm install -g thrash-cli

echo "Installing rust packages"
cargo install tealdeer
