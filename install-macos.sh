#!/bin/bash -e 

echo "Install homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Install homebrew completed. \n\n"

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

echo "Installing Rails 5.2.1..."
gem install rails -v 5.2.1
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

echo -e "Install vimrc"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo -e "Install vimrc completed. \n\n"

echo -e "Install Redis"
brew install redis
brew services start redis
echo -e "Install Redis completed."

echo -e "Install tmux"
brew install tmux
echo -e "Install tmux completed."

echo -e "Install htop"
brew install htop
echo -e "Install htop completed."

echo -e "\n\nDone. \n\n"
