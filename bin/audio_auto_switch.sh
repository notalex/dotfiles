#!/bin/bash

# Audio Auto-Switch Script for Sony Inzone Earphones
# Automatically switches audio output when USB dongle is connected/disconnected

LOG_FILE="$HOME/tmp/audio_switch.log"
INZONE_DEVICE_NAME="INZONE"  # Adjust this to match your device name
DEFAULT_DEVICE_NAME="MacBook Pro Speakers"

# Create log directory if it doesn't exist
mkdir -p "$(dirname "$LOG_FILE")"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S'): $1" >> "$LOG_FILE"
}

# Function to get current audio output device
get_current_device() {
    SwitchAudioSource -c
}

# Function to switch to device
switch_to_device() {
    local device_name="$1"
    SwitchAudioSource -s "$device_name" 2>/dev/null
    if [ $? -eq 0 ]; then
        log_message "Switched audio to: $device_name"
    else
        log_message "Failed to switch audio to: $device_name"
    fi
}

# Function to check if Inzone device is available
is_inzone_available() {
    SwitchAudioSource -a | grep -qi "$INZONE_DEVICE_NAME"
}

# Main logic
main() {
    log_message "Audio auto-switch script started"
    
    # Monitor system events for USB device changes
    while true; do
        if is_inzone_available; then
            current_device=$(get_current_device)
            if [[ ! "$current_device" =~ $INZONE_DEVICE_NAME ]]; then
                # Inzone is available but not active - switch to it
                inzone_full_name=$(SwitchAudioSource -a | grep -i "$INZONE_DEVICE_NAME" | head -1)
                if [ -n "$inzone_full_name" ]; then
                    switch_to_device "$inzone_full_name"
                fi
            fi
        else
            current_device=$(get_current_device)
            if [[ "$current_device" =~ $INZONE_DEVICE_NAME ]]; then
                # Inzone was active but now unavailable - switch to default
                switch_to_device "$DEFAULT_DEVICE_NAME"
            fi
        fi
        
        sleep 2  # Check every 2 seconds
    done
}

# Handle script termination
trap 'log_message "Audio auto-switch script stopped"; exit 0' SIGTERM SIGINT

main "$@"