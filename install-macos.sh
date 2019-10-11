#!/bin/bash -e 

RUBY_VERSION=2.6.5
RAILS_VERSION=6.0.0

echo "Install homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Install homebrew completed. \n\n"

echo "Installing rbenv..."
brew install rbenv ruby-build
echo -e "Install rbenv done. \n\n"

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

echo "Installing Ruby ${RUBY_VERSION}..."
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
ruby -v
echo -e "Installed Ruby ${RUBY_VERSION} done. \n\n"

git config --global color.ui true

echo "Installing Rails ${RAILS_VERSION}..."
gem install rails -v $RAILS_VERSION
rbenv rehash
rails -v
echo -e "Install Rails ${RAILS_VERSION} done. \n\n"

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

echo -e "Install ffmpeg"
brew install ffmpeg
echo -e "Install ffmpeg completed."

echo -e "Install youtube-dl"
brew install youtube-dl
echo -e "Install youtube-dl completed."

echo -e "\n\nDone. \n\n"
