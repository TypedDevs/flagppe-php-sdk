ARG TAG="8.3.0"
ARG PORT="80"
FROM php:${TAG}

ARG UID
RUN echo "User with UID:" ${UID}
RUN adduser -u ${UID} --disabled-password --gecos "" appuser
RUN mkdir /home/appuser/.ssh
RUN chown -R appuser:appuser /home/appuser/
RUN echo "StrictHostKeyChecking no" >> /home/appuser/.ssh/config
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/home/appuser/.bash_history" \
    && echo "$SNIPPET" >> "/home/appuser/.bashrc"
RUN echo "export COLUMNS=300" >> /home/appuser/.bashrc

RUN apt-get update
RUN apt-get install -y git acl openssl openssh-client wget zip vim libssh-dev \
    && apt-get install -y libpng-dev zlib1g-dev libzip-dev libxml2-dev libicu-dev \
    && docker-php-ext-install intl zip gd soap bcmath sockets \
    && pecl install xdebug \
    && docker-php-ext-enable --ini-name 05-opcache.ini opcache xdebug \
    && apt-get install gcc make autoconf

RUN curl https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer
RUN composer self-update

RUN mkdir -p /appdata/www

COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /appdata/www
