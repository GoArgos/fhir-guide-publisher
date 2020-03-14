#!/bin/bash
file="/guide/_genUpdatePublisher.sh"
if [ -f "$file" ]; then
  cd /guide
  /guide/_genUpdatePublisher.sh
else
  file="/guide/_genonce.sh"
  if [ -f "$file" ]; then
    file="/guide/input-cache/org.hl7.fhir.publisher.jar"
    cd /guide
    if [ -f "$file" ]; then
      /guide/_genonce.sh
    else
      /guide/_updatePublisher.sh
      /guide/_genonce.sh
    fi
  else
    echo "Unexpected framework or no guide to publish."
  fi
fi
