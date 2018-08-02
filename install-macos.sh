#!/bin/bash -e 

echo "Installing rbenv..."
brew install rbenv ruby-build
echo -e "Install rbenv done. \n\n"

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

echo "Installing Ruby..."
rbenv install 2.5.1
rbenv global 2.5.1
ruby -v
echo -e "Install Ruby done. \n\n"

git config --global color.ui true

echo "Installing Rails..."
gem install rails -v 5.2.0
rbenv rehash
rails -v
echo -e "Install Rails done. \n\n"

echo "Installing PostgreSQL..."
brew install postgresql
echo -e "Install PostgreSQL done. \n\n"

echo "Starting PostgreSQL..."
brew services start postgresql
# To upgrade databse from old version PG
# brew postgresql-upgrade-database

# To access from terminal
# psql -d postgres 
# or psql -d template1
echo -e "Start PostgreSQL completed. \n\n"

echo -e "Install git bash-completion"
brew install git bash-completion
# Add bash-completion to your ~/.bash_profile:
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
echo -e "Install git bash-completion completed. \n\n"

echo -e "\n\nDone. \n\n"
