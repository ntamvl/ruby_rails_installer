#!/bin/bash -e 

echo "Installing rbenv..."
brew install rbenv ruby-build

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

echo "Installing Ruby..."
rbenv install 2.5.1
rbenv global 2.5.1
ruby -v

git config --global color.ui true

echo "Installing Rails..."
gem install rails -v 5.2.0
rbenv rehash
rails -v

echo "Installing PostgreSQL..."
brew install postgresql

echo -e "\n\nDone."
