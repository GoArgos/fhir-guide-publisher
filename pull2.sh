#!/bin/bash
y="/yaml/"
tmp="/yaml/.temp/"
r="/guide/src/resources/"
v="/guide/src/vocabulary/"
p="/guide/src/pagecontent/"

echo Enter the resourcename to pull from HL7
read n

if [ -z "$n" ]; then
  echo
  echo "No resource name entered!"
  echo
else
  ./pull_json_resource_from_guide_to_yaml.sh $n $r $y
fi
