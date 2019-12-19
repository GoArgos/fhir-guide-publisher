#!/bin/bash
options=(
    "Pull HL7 FHIR Resource for editing (in YAML)"
    "Pull Resource (JSON) from guide for editing (in YAML)"
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
        2) ./pull2.sh; break ;;
        3) ./push.sh; break ;;
        4) ./pub.sh; break ;;
        5) break ;;
    esac
done
if (( $REPLY < 5 )); then ./menu2.sh
fi
