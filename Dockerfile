FROM ubuntu:18.04
RUN apt update && apt upgrade -y

RUN apt install curl -y && apt install gnupg2 tzdata -y
RUN echo "Australia/Adelaide" |  tee /etc/timezone
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt install -y \
  imagemagick ffmpeg libpq-dev libxml2-dev libxslt1-dev file git-core \
  g++ libprotobuf-dev protobuf-compiler pkg-config nodejs gcc autoconf \
  bison build-essential libssl-dev libyaml-dev libreadline6-dev \
  zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev \
  nginx redis-server redis-tools postgresql postgresql-contrib \
  certbot yarn libidn11-dev libicu-dev libjemalloc-dev rbenv

RUN adduser --disabled-login mastodon
USER mastodon
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN cd ~/.rbenv && src/configure && make -C src
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN RUBY_CONFIGURE_OPTS=--with-jemalloc rbenv install 2.5.3
RUN rbenv global 2.5.3
