# http://blog.coolaj86.com/articles/installing-ruby-on-ubuntu-12-04.html

sudo apt-get remove --purge ruby-rvm ruby
sudo rm -rf /usr/share/ruby-rvm /etc/rmvrc /etc/profile.d/rvm.sh

rm -rf ~/.rvm* ~/.gem/ ~/.bundle*

echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
tail ~/.gemrc

sudo apt-get update
sudo apt-get install -y \
  git \
  build-essential \
  curl \
  wget

# For bash
echo "[[ -s '${HOME}/.rvm/scripts/rvm' ]] && source '${HOME}/.rvm/scripts/rvm'" >> ~/.bashrc
# For zsh
echo "[[ -s '${HOME}/.rvm/scripts/rvm' ]] && source '${HOME}/.rvm/scripts/rvm'" >> ~/.zshrc

curl -L https://get.rvm.io | bash -s stable

sudo apt-get install -y \
  build-essential \
  openssl \
  libreadline6 \
  libreadline6-dev \
  curl \
  git-core \
  zlib1g \
  zlib1g-dev \
  libssl-dev \
  libyaml-dev \
  libxml2-dev \
  libxslt-dev \
  autoconf \
  libc6-dev \
  ncurses-dev \
  automake \
  libtool \
  bison \
  subversion \
  pkg-config

curl -L https://get.rvm.io | bash -s stable --ruby

gem install cyaml --no-ri --no-rdoc

gem install bundler --no-ri --no-rdoc