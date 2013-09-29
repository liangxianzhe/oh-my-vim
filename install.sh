#!/usr/env sh

INSTALLDIR=$PWD

create_symlinks () {
    if [ ! -f ~/.vim ]; then
        echo "Now, we will create ~/.vim and ~/.vimrc files to configure Vim."
        ln -sfn $INSTALLDIR/dotvim ~/.vim
    fi

    if [ ! -f ~/.vimrc ]; then
        ln -sfn $INSTALLDIR/dotvim/vimrc ~/.vimrc
    fi
  }

echo "Welcome friend!"

which git > /dev/null
if [ "$?" != "0" ]; then
  echo "You need git installed to install dotvim."
  exit 1
fi

which vim > /dev/null
if [ "$?" != "0" ]; then
  echo "You need vim installed to install dotvim."
  exit 1
fi

if [ ! -d "$INSTALLDIR/dotvim" ]; then
    echo "As we can't find dotvim in the current directory, we will create it."
    git clone git@github.com:liangxianzhe/dotvim.git
    create_symlinks
    cd $INSTALLDIR/dotvim

else
    echo "Seems like you already are one of ours, so let's update dotvim to be as awesome as possible."
    cd $INSTALLDIR/dotvim
    git pull origin master
    create_symlinks
fi

if [ ! -d "bundle" ]; then
    echo "Now, we will create a separate directory to store the bundles Vim will use."
    mkdir bundle
fi

if [ ! -f local.vimrc ]; then
  echo "Let's create a 'local.vimrc' file so you have some bundles by default."
  echo "let g:dotvim_packages = ['all']" > 'local.vimrc'
fi

echo "You are all set. Open your vim and it will set up a bunch of plugins for you. This may take
a while..."
echo ""
echo "We welcome any bros/sistas who want to contribute:
https://github.com/liangxianzhe/dotvim#call-for-help"
echo "Report any issue/need: https://github.com/liangxianzhe/dotvim/issues"
echo "At last, and before all, read the documentation:
https://github.com/liangxianzhe/dotvim"
