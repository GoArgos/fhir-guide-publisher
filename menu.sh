#!/bin/bash
options=(
    "Pull HL7 FHIR Resource for editing (in YAML)"
    "Push Resource (YAML) to guide (as JSON)"
    "Pull Resource (JSON) from guide for editing (as YAML)"
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
        3) ./pull2.sh; break ;;
        4) ./pub.sh; break ;;
        5) break ;;
    esac
done
if (( $REPLY < 5 )); then ./menu.sh
fi
