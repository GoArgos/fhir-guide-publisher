#!/bin/bash
in="/yaml/"
tmp="/yaml/.temp/"
r_out="/guide/src/resources/"
v_out="/guide/src/vocabulary/"
p_out="/guide/src/pagecontent/"

read -p "Push new resources to guide? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

mkdir $tmp
./generate_from_yaml.sh $in $tmp

cd $tmp
mv structuredefinition*.json $r_out
mv valueset*.json $v_out
cd $in
cp *-intro.md $p_out
