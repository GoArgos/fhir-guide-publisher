#!/bin/bash
options=(
    "Run IG Publisher"
    "Quit"
)

echo
echo
PS3="Enter a number (1-${#options[@]}): "

select option in "${options[@]}"; do
    case "$REPLY" in
        1) ./pub.sh; break ;;
        2) break ;;
    esac
done
if (( $REPLY < 2 )); then ./pub_menu.sh
fi
