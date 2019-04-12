#!/bin/bash
options=(
    "Pull HL7 FHIR Resource for editing (in YAML)"
    "Push Resource (YAML) to guide (as JSON)"
    "Publish Guide"
    "Quit"
)

echo
echo
PS3="Enter a number (1-${#options[@]}): "

select option in "${options[@]}"; do
    case "$REPLY" in
        1) ./pull.sh; break ;;
        2) ./push.sh; break ;;
        3) ./pub.sh; break ;;
        4) break ;;
    esac
done
if (( $REPLY < 4 )); then ./menu.sh
fi
