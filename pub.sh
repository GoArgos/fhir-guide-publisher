#!/bin/bash
file="/guide/_genUpdatePublisher.sh"
if [ -f "$file" ]; then
  cd /guide
  chmod +x _genUpdatePublisher.sh
  /guide/_genUpdatePublisher.sh
else
  file="/guide/_genonce.sh"
  if [ -f "$file" ]; then
    file="/guide/input-cache/org.hl7.fhir.publisher.jar"
    cd /guide
    chmod +x _genonce.sh
    if [ -f "$file" ]; then

      /guide/_genonce.sh
    else
      chmod +x _updatePublisher.sh
      /guide/_updatePublisher.sh
      /guide/_genonce.sh
    fi
  else
    echo "Unexpected framework or no guide to publish."
  fi
fi
