#!/usr/bin/env sh

DOTIES="$(pwd)"

# git
rm $HOME/.gitconfig
rm $HOME/.gitignore_global

ln -sF $DOTIES/git/.gitconfig $HOME/.gitconfig
ln -sF $DOTIES/git/.gitignore_global $HOME/.gitignore_global

# zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
