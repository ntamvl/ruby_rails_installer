#!/bin/bash -e

set -e

RUBY_VERSION=3.0.0
RAILS_VERSION=6.1.3

echo "Install homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Install homebrew completed. \n\n"

echo "Installing rbenv..."
brew install rbenv ruby-build
echo "Install rbenv done. \n\n"

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
source ~/.zshrc

echo "Installing Ruby ${RUBY_VERSION}..."
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
ruby -v
echo "Installed Ruby ${RUBY_VERSION} done. \n\n"

echo "Installing rubocop"
gem install rubocop
echo "Installing rubocop completed."

git config --global color.ui true

echo "Installing Rails ${RAILS_VERSION}..."
gem install rails -v $RAILS_VERSION
rbenv rehash
rails -v
echo "Install Rails ${RAILS_VERSION} done. \n\n"

echo "Installing PostgreSQL..."
brew install postgresql
echo "Install PostgreSQL done. \n\n"

echo "Starting PostgreSQL..."
brew services start postgresql
# To upgrade databse from old version PG
# brew postgresql-upgrade-database

# To access from terminal
# psql -d postgres
# or psql -d template1
echo "Start PostgreSQL completed. \n\n"

echo "Install git bash-completion"
brew install git bash-completion
# Add bash-completion to your ~/.bash_profile:
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
echo -e "Install git bash-completion completed. \n\n"

echo -e "Install vimrc"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo "Install vimrc completed. \n\n"

echo "Install Redis"
brew install redis
brew services start redis
echo "Install Redis completed."

echo "Install tmux"
brew install tmux
echo "Install tmux completed."

echo "Install htop"
brew install htop
echo "Install htop completed."

echo "Install ffmpeg"
brew install ffmpeg
echo "Install ffmpeg completed."

echo "Install youtube-dl"
brew install youtube-dl
echo "Install youtube-dl completed."

echo "Install midnight commander"
brew install mc
echo "Install midnight commander completed."

echo "Install ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install powerlevel10k for ohmyzsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
source ~/.zshrc
echo "Install powerlevel10k for ohmyzsh completed."

# echo "Download zsh-autosuggestions"
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# echo "Download zsh-syntax-highlighting"
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# echo "Install ohmyzsh completed."

echo "Install node"
brew install node
echo "Install node completed."

echo "Install yarn"
brew install yarn
echo "Install yarn completed."

echo -e "\n\nDone. \n\n"
