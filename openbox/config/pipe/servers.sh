#!/bin/sh
#
# Server Indicator
# An Openbox pipe menu 

# Print protocol start
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<openbox_pipe_menu>'

# Generate menu items
echo '<item label="httpd: '$(systemctl status httpd.service | grep -Po '(?!Active: )active|inactive')'"/>'
echo '<item label="mariadb: '$(systemctl status mariadb.service | grep -Po '(?!Active: )active|inactive')'"/>'

# Print protocol end
echo '</openbox_pipe_menu>'
