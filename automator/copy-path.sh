#!/usr/env bash

if [[ $# -eq 0 ]]; then
   exit 0
fi
if [[ "$2" == "local" ]]; then
    echo "$1\c" | pbcopy
else
    echo "file://$1\c" | pbcopy
fi
