#!/usr/bin/env bash
echo "REDIS INSTALL"
sleep 1s

VERSION="redis-3.2.10"
SOURCE_URL="http://download.redis.io/releases/${VERSION}.tar.gz"

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
if ! test -d /usr/local/redis
then
    mkdir /usr/local/redis
fi

if ! test -d /usr/local/redis/${VERSION}
then
    mkdir /usr/local/redis/${VERSION}
fi

make
make install

cd ..
cp -R $SOURCE_NAME /usr/local/redis/${VERSION}
cd ${VERSION}
make clean
cd ..
rm -rf ${VERSION}
rm -rf ${SOURCE_NAME}