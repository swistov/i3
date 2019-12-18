#!/bin/sh

LCD='/sys/class/backlight/intel_backlight/brightness'
MIN=0
MAX=4882
DELTA=500

CURR=$(cat /sys/class/backlight/intel_backlight/brightness)

case $1 in
        -inc)
                INC=$((CURR + DELTA))
                NEXT=$((INC > MAX ? MAX : INC))
                ;;
        -dec)
                DEC=$((CURR - DELTA))
                NEXT=$((DEC < MIN ? MIN : DEC))
                ;;
        *)
                echo "Usage: $0 [-inc|-dec]"
                exit 1
                ;;
esac

echo $NEXT > $LCD
