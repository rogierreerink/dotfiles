#!/bin/sh
#
# Battery Info
# An Openbox pipe menu

# Print protocol start
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<openbox_pipe_menu>'

# Generate menu items
echo "<item label=\"Capacity: $(cat /sys/class/power_supply/BAT0/capacity)%\"/>"
echo "<item label=\"Power: $(echo "scale=1; $(cat /sys/class/power_supply/BAT0/power_now)/1000000" | bc)W\"/>"

# Print protocol end
echo '</openbox_pipe_menu>'
