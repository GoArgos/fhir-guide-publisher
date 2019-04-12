#!/bin/bash
out="/yaml/"

echo Enter the resourcename to pull from HL7
read r

if [ -z "$r" ]; then
  echo
  echo "No resource name entered!"
  echo
else
  ./pull_resource_from_HL7.sh $r $out
fi
