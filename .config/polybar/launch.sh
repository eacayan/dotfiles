#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
if [[ $(xrandr -q | grep 'Virtual2 connected') ]]; then
	polybar main2 2>&1 | tee -a /tmp/polybar1.log & disown
fi
echo "Bars launched..."
