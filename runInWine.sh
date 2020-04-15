#!/bin/bash

# based upon https://stackoverflow.com/a/3362952

input="$@"

if [ -f $input ]; then
    filepath=${input%/*}
    filename=$(basename $input)

    echo $input
    echo $filepath
    echo $filename

    ./docker.wine.sh -v $filepath:/executable docker.wine wine /executable/$filename
else
    ./docker.wine.sh docker.wine wine $input
fi