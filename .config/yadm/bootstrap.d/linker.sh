#!/bin/bash

set -euo pipefail

echo "$(pwd)"

files=$(find . -type f -not -path '*/.git/*' | grep -v README | grep -v LICENSE)

for f in $files; do
    basedir=$(dirname $f)
    filename=$(basename $f)
    target="$MYHOME/$basedir/$filename"

    if [ ! -d $basedir ]; then
        echo "$basedir does not exist, creating"
        mkdir -p $basedir
    fi

    if [ -f "$target" ] ; then
        echo "$target already exists, moving to $target.bak"
        echo mv "$target" "$target.bak"
    else
        echo "$target does not exist, linking"
        echo ln -s "$f" "$target"
    fi
done

echo "Setting `gp` as the git credential helper"

echo git config credential.helper "/usr/bin/gp credential-helper"