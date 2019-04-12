#!/bin/bash

# optional path to folder containing source YAML files
pin=$(cd "$(dirname "$1")"; pwd)/$(basename "$1")/

# optional path to destination folder for JSON files
pout=$(cd "$(dirname "$2")"; pwd)/$(basename "$2")/

# path to this bash file
p=$(dirname "$BASH_SOURCE")

# python venv
# source $p/venv/bin/activate

# file extensions
y=".yaml"
j=".json"

# calculate time since last push
t2=$(date +%s)
if [ -f $pout.tstamp ]; then
    t1=$(cat $pout.tstamp)
    let "min = ($t2 - $t1)/60"
else
   min=258500
fi
echo $t2 > $pout.tstamp

# finally, convert and push the files
for file in $(find $pin*.yaml -mmin -$min); do
    if [ -f "$file" ]; then
        file=$(basename $file)
        echo Generating $file
        file=$(echo $file | cut -f 1 -d .)
        yaml2json $pin$file$y $pout$file$j
        python $p/validateJSON.py $pout$file$j $p/fhir.schema.json
    fi
done
