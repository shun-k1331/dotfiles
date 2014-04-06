#!/bin/bash

DOTFILES=`find $HOME/Dotfiles -name '.*' | grep -v 'dotfiles/.git$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`


for file in ${DOTFILES[@]}
do
	rm -f $HOME/$file
    ln -s $HOME/Dotfiles/$file $HOME/$file
done
