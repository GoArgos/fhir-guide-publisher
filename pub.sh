#!/bin/bash
if [ -z "$1" ]; then
  file=ig.json
else
  file=$1
fi
echo getting publisher
curl -O http://build.fhir.org/org.hl7.fhir.igpublisher.jar
echo getting rid of .DS_Store files since they gum up the igpublisher....
find . -name '.DS_Store' -type f -delete
echo running publisher
cd /guide-in
java  -Xms256m -Xmx1048m -jar /publisher/org.hl7.fhir.igpublisher.jar -ig $file -watch -tx $NA
