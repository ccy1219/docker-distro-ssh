#!/bin/bash

for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   

    case "$KEY" in
            DOCKERFILE)    DOCKERFILE=${VALUE} ;;
            IMAGE_TAG)    IMAGE_TAG=${VALUE} ;;
            ARG_PASSWD)    ARG_PASSWD=${VALUE} ;;
            ID_RSA)    ID_RSA=${VALUE} ;;
            ID_RSA_PUB)    ID_RSA_PUB=${VALUE} ;;
            *)   
    esac
done


if [ -z "$DOCKERFILE" ]
then
    echo 'Parameters DOCKERFILE error!'
    exit 1
fi

if [ -z "$IMAGE_TAG" ]
then
    echo 'Parameters IMAGE_TAG error!'
    exit 1
fi


ARG_PASSWD_STR=''
ARG_KEYS_STR=''

if [ ! -z "$ARG_PASSWD" ]
then
    ARG_PASSWD_STR=" --build-arg ARG_PASSWD=$ARG_PASSWD "
fi

if [ ! -z "$ID_RSA" ]
then
    docker build $ARG_PASSWD_STR --build-arg ID_RSA="$(cat $ID_RSA)" --build-arg ID_RSA_PUB="$(cat $ID_RSA_PUB)" --file $DOCKERFILE -t $IMAGE_TAG .
else
    docker build $ARG_PASSWD_STR  --file $DOCKERFILE -t $IMAGE_TAG .
fi
