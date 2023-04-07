#!/bin/bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ~/.zshrc ~/.zshrc.backup
cp ./newzsh ~/.zshrc

source ~/.zshrc

echo "Done!"

