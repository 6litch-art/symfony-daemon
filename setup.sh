#! /bin/bash

[[ $0 != $BASH_SOURCE ]] && export SYMFONY_SETUP="$BASH_SOURCE" || export SYMFONY_SETUP="$0"

export SYMFONY=$(dirname $(readlink -m $SYMFONY_SETUP))
export PATH=$SYMFONY/bin:$PATH
