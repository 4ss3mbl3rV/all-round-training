#!/usr/bin/env bash
if [[ $(id -u) -eq 0 ]]; then
  apt-get install ruby-full build-essential zlib1g-dev
  echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
  echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
  echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
  gem install jekyll bundler
else
  echo "Please run this script as root!"
fi
