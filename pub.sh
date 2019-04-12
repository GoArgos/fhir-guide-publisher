#!/bin/bash
file="/guide/_genonce.sh"
if [ -f "$file" ]; then
  cd /guide
  ./_genonce.sh
else
  echo "Unexpected framework or no guide to publish."
fi
