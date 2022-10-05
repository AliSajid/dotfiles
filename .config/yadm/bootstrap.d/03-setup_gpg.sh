#!/bin/bash

set -euo pipefail

echo "Setting up the GPG Keys"

if [ ! -z $GPG_KEY  ]; then
    echo "GPG Key is set, importing"
    gpg --verbose --batch --import <(echo $GPG_KEY|base64 -d)
    echo 'pinentry-mode loopback' >> ~/.gnupg/gpg.conf
    echo 'allow-loopback-pinentry' >> ~/.gnupg/gpg-agent.conf
fi
