#!/usr/bin/env sh

DOTIES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# git
rm -rf $HOME/.gitconfig
rm -rf $HOME/.gitignore_global

ln -sF $DOTIES/git/.gitconfig $HOME/.gitconfig
ln -sF $DOTIES/git/.gitignore_global $HOME/.gitignore_global

# tmux
rm -rf $HOME/.tmux.conf

ln -sF $DOTIES/tmux/tmux.conf $HOME/.tmux.conf

# kitty
rm -rf $HOME/.config/kitty

ln -sF $DOTIES/kitty $HOME/.config/kitty

# nvim
rm -rf $HOME/.config/nvim

ln -sF $DOTIES/nvim $HOME/.config/nvim

# vim
rm -rf $HOME/.vimrc
ln -sF $DOTIES/.vimrc $HOME/.vimrc

if [ ! -d "$HOME/.vim/autoload" ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


# zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

rm -f $HOME/.oh-my-zsh/themes/zuq.zsh-theme
ln -sF $DOTIES/zsh/zuq.zsh-theme $HOME/.oh-my-zsh/themes/zuq.zsh-theme
