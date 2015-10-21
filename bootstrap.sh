#!/bin/env bash
which git
if [[ $? -ne 0 ]]; then 
    echo "git is not installed"
    exit 1
fi

which vim
if [[ -ne 0 ]]; then
    echo "vim is not installed"
    exit 1
fi

vimVersion=`vim --version | grep IMproved | awk '{print $5}'`
if [ ${vimVersion/./} -lt 74  ];then 
    echo "Your vim version is $vimVersion, version 7.4 or higher is recommended."
fi

git submodule init
git submodule update
if [[ $? -ne 0 ]]; then
    echo "Failed to execute 'git submodule update'. Please check your network."
fi

if [[ -f $HOME/.gitconfig ]]; then
    mv $HOME/.gitconfig{,.bak}
    ln -s $PWD/gitconfig $HOME/.gitconfig
fi

if [[ -f $HOME/.vimrc ]]; then
    mv $HOME/.vimrc{,.bak}
    ln -s $PWD/vimrc $HOME/.vimrc
fi

if [[ -d $HOME/.vim ]]; then
    mv $HOME/.vim{,.bak}
    mkdir -p $HOME/.vim/bundle
    ln -s $PWD/vundle $HOME/.vim/bundle/vundle
fi

if [[ -f $HOME/.tmux.conf ]]; then
    mv $HOME/.tmux.conf{,.bak}
    ln -s $PWD/tmux.conf $HOME/.tmux.conf
fi

vim -c VundleInstall
echo "Initialize configuration successfully!"
