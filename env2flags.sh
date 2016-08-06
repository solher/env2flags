#!/bin/sh

env=true
flags=""
commands=""

for arg in "$@"
do
    if [ "$arg" == "--" ];
    then
        env=false
        continue
    fi

    if $env;
    then
        value=$(eval "echo \$$arg")
        if [ "$value" == "" ]; then continue; fi
        flag=$(printf $arg | sed 's/_/./g' | awk '{printf "%s", tolower($0)}')
        flags="$flags-$flag=$value "
    else
        commands="$commands$arg "
    fi
done

cmd="$commands$flags"
exec $cmd