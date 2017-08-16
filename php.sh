#!/usr/bin/env bash
echo "PHP INSTALL"
sleep 1s

VERSION="php-7.1.8"
SOURCE_URL="http://cn2.php.net/get/${VERSION}.tar.gz/from/this/mirror"

SOURCE_NAME="${VERSION}.tar.gz"
if ! test -f $SOURCE_NAME
then
    wget ${SOURCE_URL} -O ${SOURCE_NAME}
fi

if ! test -d ${VERSION}
then
    tar xzf $SOURCE_NAME
fi

cd $VERSION
if ! test -d /usr/local/php
then
    mkdir /usr/local/php
fi

if ! test -d /usr/local/php/php_common_conf_ini_dir
then
    mkdir /usr/local/php/php_common_conf_ini_dir
fi

./configure --prefix="/usr/local/php/${VERSION}" '--with-config-file-path=/usr/local/php/${VERSION}' '--with-config-file-scan-dir=/usr/local/php/php_common_conf_ini_dir'  '--with-mysqli=mysqlnd' '--with-pdo-mysql=mysqlnd' '--enable-fpm' '--enable-static' '--enable-inline-optimization' '--enable-sockets' '--enable-wddx' '--enable-zip' '--enable-calendar' '--enable-bcmath' '--enable-soap' '--with-zlib' '--with-iconv' '--with-gd' '--with-xmlrpc' '--enable-mbstring' '--with-curl' '--with-openssl' '--with-mcrypt' '--enable-fileinfo' '--enable-pcntl'
make
make install