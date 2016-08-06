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
        flag=$(printf $arg | sed 's/_/./g' | awk '{printf "%s", tolower($0)}')
        flags="$flags-$flag=$(eval "echo \$$arg") "
    else
        commands="$commands$arg "
    fi
done

cmd="$commands$flags"
exec $cmd