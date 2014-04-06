#!/bin/bash

DOTFILES=`find $HOME/dotfiles -name '.*' | grep -v 'dotfiles/.git$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`


for file in ${DOTFILES[@]}
do
	rm -f $HOME/$file
    ln -s $HOME/dotfiles/$file $HOME/$file
done
