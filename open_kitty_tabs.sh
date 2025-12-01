##!/bin/bash
#
## Script to open 5 kitty tabs with specific titles
## Usage: ./open_kitty_tabs.sh
## Author: Rose-tech01
## Date: 2025-03-08
#
## Check if kitty is already running
#if ! pgrep -x "kitty" >/dev/null; then
#  # If kitty is not running, start it with the first tab
#  kitty --title "psql" &
#  sleep 1
#  clear
#else
#  # If kitty is running, just create the first tab in the current window
#  kitty @ launch --type=tab --tab-title "psql"
#fi
#
## Create the remaining tabs
#kitty @ launch --type=tab --tab-title "sql_editor"
#kitty @ launch --type=tab --tab-title "client"
#kitty @ launch --type=tab --tab-title "server"
#kitty @ launch --type=tab --tab-title "home_cloud"
#
#echo "All tabs have been opened and titled successfully!"

# Script to open 5 kitty tabs with specific titles
# Usage: ./open_kitty_tabs.sh
# Author: Rose-tech01
# Date: 2025-03-08

# Function to create a new tab and clear the terminal
create_tab() {
  kitty @ launch --type=tab --tab-title "$1"
  sleep 0.5 # Chờ một chút để đảm bảo tab được tạo trước khi chạy lệnh
  kitty @ send-text -m title:"$1" "clear\n"
}

# Check if kitty is already running
if ! pgrep -x "kitty" >/dev/null; then
  # If kitty is not running, start it with the first tab
  kitty --title "psql" &
  sleep 1
  kitty @ send-text -m title:"psql" "clear\n"
else
  # If kitty is running, just create the first tab in the current window
  create_tab "psql"
fi

# Create the remaining tabs and clear them
create_tab "sql_editor"
create_tab "client"
create_tab "server"
create_tab "home_cloud"

echo "All tabs have been opened and titled successfully!"
