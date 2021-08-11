!#/bin/sh
set -e

curl -L git.io/antigen > ~/antigen.zsh

ln -s ~/dotfiles/universal/zshrc/m1/.zsh_aliases ~/.zsh_aliases
ln -s ~/dotfiles/universal/zshrc/m1/.zsh_functions ~/.zsh_functions
ln -s ~/dotfiles/universal/zshrc/m1/.zshrc ~/.zshrc
ln -s ~/dotfiles/universal/antigenrc/.antigenrc ~/.antigenrc
ln -s ~/dotfiles/universal/tmux/.tmux.conf ~/.tmux.conf
