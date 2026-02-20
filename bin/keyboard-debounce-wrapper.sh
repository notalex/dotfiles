#!/bin/bash

# Wrapper to auto-restart keyboard debouncer on disconnect
SCRIPT_PATH="$(dirname "$(realpath "$0")")/key-debounce.py"

echo "Starting keyboard debouncer with auto-restart..."
echo "Press Ctrl+C to stop"
echo

while true; do
    if lsusb | grep -q "Keychron V8"; then
        python3 "$SCRIPT_PATH"
        EXIT_CODE=$?

        # Exit cleanly if user pressed Ctrl+C
        if [ $EXIT_CODE -eq 130 ]; then
            echo "Stopped by user"
            exit 0
        fi

        echo "Debouncer stopped (exit code: $EXIT_CODE)"
    else
        echo "Waiting for 'Keychron V8'..."
    fi

    duration=15
    echo "Retrying in $duration seconds..."
    sleep $duration
done
