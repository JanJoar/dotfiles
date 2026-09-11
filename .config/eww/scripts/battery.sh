#!/bin/sh

for status_file in /sys/class/power_supply/BAT*/status; do
    [ -r "$status_file" ] || continue

    case "$(cat "$status_file")" in
        Charging)
            printf '%s\n' ''
            ;;
        *)
            printf '%s\n' ''
            ;;
    esac

    exit 0
done

printf '%s\n' ''
