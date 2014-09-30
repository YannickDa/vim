Ma config VIM
=============

Installation
------------

### Requirement

#### Ack

> yum install ack

#### Powerline

> yum install vim-plugin-powerline

#### Ctags

> yum install ctags

### Install

> git clone git@github.com:YannickDa/vim.git ~/.vim
> ln -s ~/.vim/vimrc ~/.vimrc
> cd ~/.vim
> git submodule init
> git submodule update
> vim +PluginInstall +qall
> vim +BundleInstall +qall
