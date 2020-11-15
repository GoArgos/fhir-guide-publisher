#!/bin/bash
options=(
    "Run IG Publisher"
    "Shell"
    "Quit"
)

echo
echo
PS3="Enter a number (1-${#options[@]}): "

select option in "${options[@]}"; do
    case "$REPLY" in
        1) ./pub.sh ;;
	2) bash ;;
        3) break ;;
    esac
done
