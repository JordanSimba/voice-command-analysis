#!/bin/bash

container=$1
src_mount=$2

final_cmd=''
base_cmd="docker run -it --rm"

if [[ -z $src_mount ]]
then
    final_cmd="$base_cmd $container"
else
    final_cmd="$base_cmd -v $src_mount $container"
fi

exec $final_cmd