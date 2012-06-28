#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -d "$HOME/.vim" ] then
	echo "You already got a $HOME/.vim dir - I'll move it to $HOME/.vim.old"
	mv $HOME/.vim $HOME/.vim.old
fi
if [ -f "$HOME/.vimrc" ] then
	echo "You already got a $HOME/.vimrc file - I'll move it to $HOME/.vimrc.old"
	mv $HOME/.vimrc $HOME/.vimrc.old
fi
echo "Vim-dotfiles is in $DIR - symlinking to .vim and .vimrc"
ln -s $DIR $HOME/.vim
ln -s $DIR/vimrc $HOME/.vimrc
echo "All done - you're ready to rock n' roll!!"
