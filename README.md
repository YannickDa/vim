Ma config VIM
=============

Installation
------------

git clone git@github.com:YannickDa/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update


Installation de fonts POWERLINE sur Fedora 19
---------------------------------------------

Instructions : https://powerline.readthedocs.org/en/latest/installation/linux.html#installation-linux

Commandes :

mkdir  ~/.fonts ~/.fonts.conf.d
wget -P ~/.fonts https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
fc-cache -vf ~/.fonts
wget -P ~/.fonts.conf.d https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
