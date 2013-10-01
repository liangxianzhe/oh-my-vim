#!/usr/env sh

# Tools we need
brew install ctags ag ack ranger tig

# This config need lua installed for faster script excution
brew install lua 
brew install luajit

# Now install vim with lua support
brew install vim --with-lua --with-clipboard --override-system-vi

# Make sure you have pip
brew install python

# Install tools for Python
echo "Pip need to be sudo. Please input your password:"
sudo pip install pylint virtualenvwrapper coverage
