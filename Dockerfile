FROM php:5-apache

RUN apt update && apt install -y unzip wget \
    && wget -q https://github.com/pouya-racker/google-cloud-datastore-php/archive/master.zip \
    && unzip master.zip && rm -rf master.zip && cd google-cloud-datastore-php-master/ \
    && chmod 777 /var/www -R \
    && cp calldatastore.php form.html loaddatastore.php /var/www/html \
    && curl -sS https://getcomposer.org/installer | php \
    && php composer.phar require google/auth \
    && php composer.phar require google/cloud \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
EXPOSE 80

CMD ["apache2-foreground"]