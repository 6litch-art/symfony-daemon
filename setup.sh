#! /bin/bash

[[ $0 != $BASH_SOURCE ]] && export SYMFONY_DAEMON_SETUP="$BASH_SOURCE" || export SYMFONY_DAEMON_SETUP="$0"

export SYMFONY_DAEMON=$(dirname $(readlink -m $SYMFONY_DAEMON_SETUP))
export PATH=$SYMFONY_DAEMON/bin:$PATH
