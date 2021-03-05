#!/bin/sh

# install useful packages
sudo apt install neofetch
sudo apt install xclip
sudo apt install zsh
sudo apt install tmux

# change shell to zsh
chsh -s $(which zsh)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# source the correct files
source ~/.zprofile
source ~/.zshrc
tmux source ~/.tmux.conf

# copy dotfiles
cp work/* ~/
