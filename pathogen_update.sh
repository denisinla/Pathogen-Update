#!/usr/bin/env bash

quiet=$1

if [ -d "$HOME/Dropbox/vim/autoload" ]; then
    cd "$HOME/Dropbox/vim/autoload"
    curl -O https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

if [ -d "$HOME/Dropbox/vim/bundle" ]; then
    for bundle in "$HOME/Dropbox/vim/bundle/"*
    do
        if [ -d "$bundle/.git" ]; then
            if [ "$quiet" != "-q" ]; then
                printf "Working on %s...\n" ${bundle##*/}
                cd "$bundle"; git pull 2>/dev/null
            else
                cd "$bundle"; git pull 1>/dev/null 2>&1
            fi
        fi
    done
fi