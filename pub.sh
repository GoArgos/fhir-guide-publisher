#!/bin/bash
cd /guide
file="/guide/_genonce.sh"
if [ -f "$file" ]; then
  file="/guide/input-cache/publisher.jar"
  sed -i -e 's/java -jar/java -Xmx2g -jar/g' /guide/_genonce.sh
  if [ -f "$file" ]; then
    /guide/_genonce.sh
  else
    /guide/_updatePublisher.sh
    /guide/_genonce.sh
  fi
  sed -i -e 's/java -Xmx2g -jar/java -jar/g' /guide/_genonce.sh
else
  echo "Unexpected framework or no guide to publish."
fi
