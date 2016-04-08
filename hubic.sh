#!/bin/sh
# Created by Cdiez50
# First create your Backup folder on your system
# Here it will be backup/

set pass "YOUR_PASSWORD"
account "YOUR_EMAIL"


FILE=""

# Put here your HubiC Folder 
DIR="/"

# look for empty dir
# If not start synchro :

if [ "$(ls -A $DIR)" ]; then
     echo "$DIR is not Empty"
     
hubic stop

# Prevent if "Cannot contact daemon, are you sure it is running?" warning exists.
export DBUS_SESSION_BUS_ADDRESS=`dbus-daemon --session --fork --print-address`

hubic start

hubic login $account /backup/

expect "Password"
send "$pass\r"

# We can create log of action 
# Be sure that you've got directory in your /

touch /loghubic/"$(date +%F) done"

else
    # We add log notification
    touch /loghubic/"$(date +%F) $DIR is Empty"
fi
# rest of the logic

exit
