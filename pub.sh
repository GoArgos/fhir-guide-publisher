#!/bin/bash
file="/guide/_genUpdatePublisher.sh"
if [ -f "$file" ]; then
  cd /guide
  ./_genUpdatePublisher.sh
else
  echo "Unexpected framework or no guide to publish."
fi
