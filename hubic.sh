#!/bin/sh
# Created by Cdiez50
# First create your Backup folder on your system
# Here it will be backup/

set pass "YOUR_PASSWORD"
account "YOUR_EMAIL"

hubic stop

# Prevent if "Cannot contact daemon, are you sure it is running?" warning.
export DBUS_SESSION_BUS_ADDRESS=`dbus-daemon --session --fork --print-address`

hubic start

hubic login $account /backup/

expect "Password"
send "$pass\r"

# We can create log of action 
# Be sure that you've got directory in your /

touch /loghubic/"$(date +%F) done"

exit
