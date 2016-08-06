#!/bin/bash

flags=""

for env in "$@"
do
    flag=$(printf ${env//_/.} | awk '{printf "%s", tolower($0)}')
    flags="$flags -$flag=${!env}"
done

printf " $flags"
