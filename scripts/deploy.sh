#!/bin/bash
# Autor: Barckcode
# Description: Script to deploy in production

######################### VARS
# Binaries
BINARY="/bin"
USR_BINARY="/usr/bin"

# Paths
SOURCE_CODE="/var/www/helmcode.com"

# Commands
DATE=`date":"`


cd $SOURCE_CODE
$USR_BINARY/git checkout .
$USR_BINARY/git pull

if [[ $? -eq 0 ]]
then
    echo "************************" >> /tmp/deploy.log
    echo "$DATE Pull ejecutado con éxito" >> /tmp/deploy.log
    $BINARY/systemctl restart nginx

    if [[ $? -eq 0 ]]
    then
        echo "$DATE Restart de nginx ejecutado con éxito" >> /tmp/deploy.log
    else
        echo "$DATE ERROR - Restart de nginx ejecutado sin éxito" >> /tmp/deploy.log
    fi
else
    echo "$DATE ERROR - Pull ejecutado sin éxito" >> /tmp/deploy.log
fi
