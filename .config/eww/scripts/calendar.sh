#!/bin/sh
LOCK_FILE="/tmp/eww-calendar.lock"
EWW_BIN="eww"

run() {
    ${EWW_BIN} open calendar
}

# Open widgets
if [[ ! -f "$LOCK_FILE" ]]; then
    touch "$LOCK_FILE"
    run && echo "ok good!"
else
    ${EWW_BIN} close calendar
    rm "$LOCK_FILE" && echo "closed"
fi

