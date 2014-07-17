#!/bin/sh

DIR=`pwd`

LIST="
c.dict
cpp.dict
java.dict
javascript.dict
lua.dict
ocaml.dict
perl.dict
php.dict
scheme.dict
vim.dict
"

mkdir $HOME/.vim/dict

for i in ${LIST[@]}
do
	cd $HOME/.vim/dict/
	wget https://github.com/yuroyoro/dotfiles/tree/master/.vim/dict/${i}
	cd $DIR
done

