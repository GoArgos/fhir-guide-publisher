#!/bin/bash
options=(
    "Run IG Publisher"
    "Other Stuff"
    "Quit"
)

echo
echo
PS3="Enter a number (1-${#options[@]}): "

select option in "${options[@]}"; do
    case "$REPLY" in
        1) ./pub.sh; break ;;
        2) ./menu2.sh; break ;;
        3) break ;;
    esac
done
if (( $REPLY < 3 )); then ./menu.sh
fi
