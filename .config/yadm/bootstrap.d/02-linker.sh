#!/bin/bash

set -euo pipefail

echo "Bootstrapping the system with dotfiles"
echo "Starting Directory: $(pwd)"

files=$(find '.dotfiles' -type f -not -path '*/.git/*' | grep -v README | grep -v LICENSE | grep -v bootstrap | cut -d'/' -f2-)

for f in $files; do
    echo "Processing $f"
    basedir=$(dirname $f)
    filename=$(basename $f)
    targetdir="$HOME/$basedir"
    target="$targetdir/$filename"

    if [ ! -d $targetdir ]; then
        echo "$targetdir does not exist, creating"
        mkdir -p $targetdir
    else
        echo "$targetdir exists. Skipping"
    fi

    if [ -f "$target" ] ; then
        echo "$target already exists, moving to $target.pre-bootstrap"
        mv "$target" "$target.pre-bootstrap"
        ln -sf "$HOME/.dotfiles/$f" "$target"
    else
        echo "$target does not exist, linking"
        ln -sf "$HOME/.dotfiles/$f" "$target"
    fi
done

echo "Setting 'gp' as the git credential helper"

echo git config credential.helper "/usr/bin/gp credential-helper"