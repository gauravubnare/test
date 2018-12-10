FROM ubuntu:18.04
RUN apt update -y;apt install git redis-server sphinxsearch wget lsb-release mysql-server sudo mysql-client gnupg curl imagemagick libmagickcore-dev  libmagickwand-dev  libxslt1.1 libxslt1-dev libxslt1-dbg  libmysqlclient-dev  libssl-dev  libreadline-dev nodejs bundler  software-properties-common -y
RUN sudo apt-add-repository -y ppa:rael-gc/rvm 
RUN sudo apt-get update 
RUN sudo apt-get install rvm -y && /bin/bash -c "source /etc/profile.d/rvm.sh" && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && curl -sSL https://rvm.io/mpapis.asc | gpg --import - && curl -L get.rvm.io | bash -s stable 
RUN /usr/share/rvm/bin/rvm requirements && /usr/share/rvm/bin/rvm install ruby && /usr/share/rvm/bin/rvm install 2.3.3 
RUN sudo ln -s /home/ubuntu/phantomjs/phantomjs-1.6.0-linux-x86_64-dynamic/bin/phantomjs /usr/local/bin/phantomjs-160
RUN sudo ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/Magick-config /usr/bin/Magick-config
RUN  sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf && usermod -d /var/lib/mysql/ mysql
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && sudo ln -s /home/dquach/phantomjs/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs-210
RUN service mysql stop &&  service mysql restart 
ENTRYPOINT service mysql restart && echo "CREATE DATABASE snacknation_development DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -u root && echo "CREATE USER 'webapp'@'%' IDENTIFIED BY '91admin';" | mysql -u root && echo "GRANT ALL  ON *.* TO 'webapp'@'%';" | mysql -u root && /bin/bash 
