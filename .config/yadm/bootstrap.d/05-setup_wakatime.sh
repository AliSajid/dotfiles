#!/bin/bash

set -euo pipefail

echo "Setting up the GPG Keys"

if [ ! -z $WAKATIME_API_KEY  ]; then
    echo "WakaTime API Key is set, importing"
    echo "[settings]" > ~/.wakatime.cfg
    echo "api_key = $WAKATIME_API_KEY" >> ~/.wakatime.cfg
fi
