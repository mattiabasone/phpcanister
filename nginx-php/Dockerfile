FROM ubuntu:18.04

ARG HOST_USER_UID
ARG APP_CODE_PATH_CONTAINER

ENV DEBIAN_FRONTEND noninteractive
ENV PHP_XDEBUG_IDE_KEY PHPSTORM

USER root

RUN apt-get update && \
    apt-get install --no-install-recommends -y aptitude apt-utils software-properties-common \
    curl git gpg-agent iproute2 nginx sudo supervisor unzip vim && \
    rm -rf /var/lib/apt/lists/*

# Adding PHP Ondrej repos
RUN add-apt-repository -y ppa:nginx/stable && \
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
   	# PHP71
   	apt-get install --no-install-recommends -y php7.1 php7.1-calendar  php7.1-ctype php7.1-curl php7.1-dom php7.1-exif \
    php7.1-fileinfo php7.1-ftp php7.1-gd php7.1-gettext php7.1-iconv php7.1-intl php7.1-json \
	php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-mysqli php7.1-mysqlnd \
   	php7.1-PDO  php7.1-Phar php7.1-posix php7.1-readline php7.1-shmop \
   	php7.1-SimpleXML php7.1-sockets php7.1-sysvmsg php7.1-sysvsem php7.1-sysvshm \
   	php7.1-tokenizer php7.1-wddx php7.1-xml php7.1-xmlreader php7.1-xmlwriter \
   	php7.1-xsl php7.1-opcache php7.1-zip php7.1-fpm php7.1-bcmath
    # PHP72
RUN apt-get install --no-install-recommends -y php7.2 php7.2-calendar php7.2-ctype php7.2-curl php7.2-dom php7.2-exif \
    php7.2-fileinfo php7.2-ftp php7.2-gd php7.2-gettext php7.2-iconv php7.2-intl php7.2-json \
    php7.2-mbstring php7.2-mysql php7.2-mysqli php7.2-mysqlnd \
    php7.2-PDO php7.2-Phar php7.2-posix php7.2-readline php7.2-shmop \
    php7.2-SimpleXML php7.2-sockets php7.2-sysvmsg php7.2-sysvsem php7.2-sysvshm \
    php7.2-tokenizer php7.2-wddx php7.2-xml php7.2-xmlreader php7.2-xmlwriter \
    php7.2-xsl php7.2-opcache php7.2-zip php7.2-fpm php7.2-bcmath
    # PHP73
RUN apt-get install --no-install-recommends -y php7.3 php7.3-calendar  php7.3-ctype php7.3-curl php7.3-dom php7.3-exif \
    php7.3-fileinfo php7.3-ftp php7.3-gd php7.3-gettext php7.3-iconv php7.3-intl php7.3-json \
	php7.3-mbstring php7.3-mysql php7.3-mysqli php7.3-mysqlnd \
   	php7.3-PDO php7.3-Phar php7.3-posix php7.3-readline php7.3-shmop \
   	php7.3-SimpleXML php7.3-sockets php7.3-sysvmsg php7.3-sysvsem php7.3-sysvshm \
   	php7.3-tokenizer php7.3-wddx php7.3-xml php7.3-xmlreader php7.3-xmlwriter \
   	php7.3-xsl php7.3-opcache php7.3-zip php7.3-fpm php7.3-bcmath
   	# PHP74
RUN apt-get install --no-install-recommends -y php7.4 php7.4-calendar php7.4-ctype php7.4-curl php7.4-dom php7.4-exif \
    php7.4-fileinfo php7.4-ftp php7.4-gd php7.4-gettext php7.4-iconv php7.4-intl php7.4-json \
    php7.4-mbstring php7.4-mysql php7.4-mysqli php7.4-mysqlnd \
    php7.4-PDO php7.4-Phar php7.4-posix php7.4-readline php7.4-shmop \
    php7.4-SimpleXML php7.4-sockets php7.4-sysvmsg php7.4-sysvsem php7.4-sysvshm \
    php7.4-tokenizer php7.4-xml php7.4-xmlreader php7.4-xmlwriter \
    php7.4-xsl php7.4-opcache php7.4-zip php7.4-fpm php7.4-bcmath && \
   	apt-get install -y php-memcached php-redis php-imagick php-mongo php-xdebug && \
   	rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# Adding phpcanister user
RUN useradd phpcanister -u ${HOST_USER_UID} -d /phpcanister -s /bin/bash
RUN groupmod phpcanister -g ${HOST_USER_UID}
RUN echo "phpcanister ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/phpcanister
RUN mkdir -p /phpcanister/bin
RUN mkdir -p ${APP_CODE_PATH_CONTAINER}

# Installing composer
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php; php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN curl https://getcomposer.org/composer.phar -o /phpcanister/bin/composer.phar

COPY .bash_aliases /root/.bash_aliases
RUN cp /root/.profile /phpcanister/.profile
RUN cp /root/.bashrc /phpcanister/.bashrc
RUN cp /root/.bash_aliases /phpcanister/.bash_aliases

# nginx configuration
RUN mkdir /etc/nginx/sites
RUN mkdir /etc/nginx/ssl
COPY nginx/nginx.conf /etc/nginx/
COPY nginx/conf.d/*.conf /etc/nginx/conf.d/

# Copying FPM pools configuration
COPY fpm/7.1.conf /etc/php/7.1/fpm/pool.d/www.conf
COPY fpm/7.2.conf /etc/php/7.2/fpm/pool.d/www.conf
COPY fpm/7.3.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY fpm/7.4.conf /etc/php/7.4/fpm/pool.d/www.conf

# Enabling xdebug
RUN for tmp_php_version in 7.1 7.2 7.3 7.4;\
    do \
        echo "xdebug.remote_enable=1" >> /etc/php/${tmp_php_version}/fpm/conf.d/20-xdebug.ini;\
        echo "xdebug.remote_host=docker.host.internal" >> /etc/php/${tmp_php_version}/fpm/conf.d/20-xdebug.ini;\
        echo "xdebug.remote_port=9000" >> /etc/php/${tmp_php_version}/fpm/conf.d/20-xdebug.ini;\
        echo "xdebug.idekey=${PHP_XDEBUG_IDE_KEY}" >> /etc/php/${tmp_php_version}/fpm/conf.d/20-xdebug.ini;\
done

# Creating dir for fpm sockets
RUN mkdir /run/php/
RUN chown phpcanister:root /run/php/

COPY supervisor/* /etc/supervisor/conf.d/

VOLUME ${APP_CODE_PATH_CONTAINER}

RUN chown -R phpcanister:phpcanister /phpcanister
RUN chown -R phpcanister:phpcanister ${APP_CODE_PATH_CONTAINER}

USER phpcanister

RUN composer global require hirak/prestissimo

WORKDIR /phpcanister/code

ADD ./startup.sh /startup.sh
CMD ["/bin/bash", "/startup.sh"]

EXPOSE 80 443