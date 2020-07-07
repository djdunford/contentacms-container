# contentacms - quick install, for developer evaluation only
#
# dockerised version of Quick Install described at contentacms.org
#

# use php 7.3 Debian Stretch base image
FROM php:7.3-stretch
WORKDIR /root

# location to install contentacms in the containerfs
ENV install_path /tmp/contentacms
RUN adduser user

# need to install composer, git, zip, zlib and libpng
RUN apt-get -y update
RUN apt-get -y install git zip zlib1g-dev libpng-dev
RUN docker-php-ext-install gd
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN mv composer.phar /usr/local/bin/composer

# switch user
USER user
WORKDIR /home/user

# install contentacms
COPY contentacms-install.sh .
COPY contentacms-start.sh .
EXPOSE 8888
RUN ./contentacms-install.sh

# run contentacms in php dev server
CMD ./contentacms-start.sh
