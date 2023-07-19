FROM php:8.0-apache
RUN apt-get -y update \
    && apt-get install -y libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl
RUN docker-php-ext-install mysqli pdo pdo_mysql
COPY app/ /var/www/html/