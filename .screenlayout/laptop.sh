#!/bin/sh
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --mode 1920x515 --pos 0x1080 --rotate normal --output DP-2 --off --output HDMI-1 --off --output DP-3 --off --output HDMI-2 --off --output HDMI-3 --off
xinput map-to-output 'ELAN9008:00 04F3:2D55' eDP-1
xinput map-to-output 'ELAN9009:00 04F3:2C1B' DP-1
