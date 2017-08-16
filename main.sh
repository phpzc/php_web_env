#!/usr/bin/env bash

ENV_STR=`uname`
if [ $ENV_STR = "Linux" ]
then
    echo "Linux Env:"
    echo "Begin Install:"
else
    echo "Not Linux Env And Exit!"
    echo "This Script Do not Support Other System!"
    exit 0
fi

sh php_depend.sh
sh php.sh
sh nginx.sh
sh redis.sh

echo "INSTALL END:----"
echo "[ PHP NGINX REDIS]"
