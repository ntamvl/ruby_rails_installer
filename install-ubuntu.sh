#!/bin/bash

set -e

RUBY_VERSION=3.0.3
RAILS_VERSION=7.0.2.3

echo "Install recommend packages"
sudo apt update
sudo apt -y install curl

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt install -y gcc g++ make git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
echo "Install recommend packages completed. \n\n"

echo "Installing rbenv..."
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
bash
echo -e "Install rbenv done. \n\n"

echo "Installing Ruby ${RUBY_VERSION}..."
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
ruby -v
echo -e "Installed Ruby ${RUBY_VERSION} done. \n\n"

git config --global color.ui true

echo "gem: --no-ri --no-rdoc" > ~/.gemrc

echo "Installing Rails ${RAILS_VERSION}..."
gem install rails -v $RAILS_VERSION
rbenv rehash
rails -v
echo -e "Install Rails ${RAILS_VERSION} done. \n\n"

echo "Starting PostgreSQL..."
sudo apt install -y postgresql postgresql-contrib
# sudo -i -u postgres
# psql

# sudo apt -y install postgresql-11 libpq-dev
# to create new user and access from terminal
# sudo -u postgres createuser tam -s
# If you would like to set a password for the user, you can do the following
# sudo -u postgres psql
# postgres=# \password tam
echo -e "Start PostgreSQL completed. \n\n"

echo -e "Install bash-completion"
sudo apt install -y bash-completion
# cat /etc/profile.d/bash_completion.sh
## source it from ~/.bashrc or ~/.bash_profile ##
# echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashrc
## Another example Check and load it from ~/.bashrc or ~/.bash_profile ##
# grep -wq '^source /etc/profile.d/bash_completion.sh' ~/.bashrc || echo 'source /etc/profile.d/bash_completion.sh'>>~/.bashrc

# Add bash-completion to your ~/.bash_profile:
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
echo -e "Install bash-completion completed. \n\n"

echo -e "Install vimrc"
sudo apt install -y vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo -e "Install vimrc completed. \n\n"

echo -e "Install Redis"
sudo apt install -y redis-server
echo -e "Install Redis completed."

echo -e "Install tmux"
sudo apt install -y tmux
echo -e "Install tmux completed."

echo -e "Install htop"
sudo apt install -y htop
echo -e "Install htop completed."

echo -e "Install ffmpeg"
sudo apt install -y ffmpeg
echo -e "Install ffmpeg completed."

echo -e "Install youtube-dl"
sudo apt install -y youtube-dl
echo -e "Install youtube-dl completed."

echo "Install ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Install ohmyzsh completed."

echo "Install powerlevel10k for ohmyzsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Install powerlevel10k for ohmyzsh completed."

echo -e "\n\nDone. \n\n"
