#/bin/bash

echo "This script replaces the current vim settings!"

rm -rf ~/.vimrc
rm -rf ~/.vim/
cp .vimrc ~/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

vim +PlugInstall +qall 
cp -r colors ~/.vim/
