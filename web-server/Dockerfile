FROM ubuntu
ENV TZ=Europe/Moscow
ENV DEBIAN_FRONTEND=nointeractive
EXPOSE 80

RUN echo 'start'
RUN apt update \
    && apt install -y software-properties-common  \
    && add-apt-repository ppa:ondrej/php  \
    && apt update

# APACHE
RUN apt install -y apache2
RUN apt install -y apache2-utils
RUN apt install -y libapache2-mod-php7.3
RUN a2enmod rewrite

# PHP
RUN apt install -y php7.3
RUN apt install -y php7.3-mysql
RUN apt install -y php7.3-gd
RUN apt install -y php7.3-xml
RUN apt install -y php7.3-ldap
RUN apt install -y php7.3-curl
RUN apt install -y php7.3-mbstring

#Composer
RUN apt install -y unzip
RUN apt install -y curl
RUN cd ~ \
    && curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php \
    && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

ADD ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

RUN mkdir -p /run/apache2 \
    && mkdir -p /var/www/_logs \
    && chmod -R 777 /var/www/_logs


ENTRYPOINT ["/docker-entrypoint.sh"]

