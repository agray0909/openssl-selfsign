#!/bin/bash

set -e

cd `dirname $0`/cert
source config.sh

username=$1
if [ -z "$username" ]; then
    echo "usage: $0 <username>"
    exit 1
fi

if [ ! -f newcerts/$username/$username.crt ]; then
    echo "Error: invalid user '$username'"
    exit 1
fi

cd newcerts/$username/
curl -k -i https://$domain/ --cert ${username}.crt --key ${username}.key
