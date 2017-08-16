#!/usr/bin/env bash
echo "NGINX INSTALL"
sleep 1s

VERSION="nginx-1.12.1"
SOURCE_URL="http://nginx.org/download/${VERSION}.tar.gz"

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
if ! test -d /usr/local/nginx
then
    mkdir /usr/local/nginx
fi
./configure --prefix="/usr/local/nginx/${VERSION}"
make
make install
cd ..
rm -rf $VERSION
rm -rf $SOURCE_NAME