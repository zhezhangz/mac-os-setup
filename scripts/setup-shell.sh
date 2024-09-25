#!/bin/bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Append .zhe to .zshrc
echo 'export ZHE_DIR="$HOME/.zhe-rc"' >> ~/.zshrc
echo 'source "$ZHE_DIR/rc"' >> ~/.zshrc

# Clone .zhe-rc
git clone git@github.com:zhezhangz/.zhe-rc.git ~/.zhe-rc
