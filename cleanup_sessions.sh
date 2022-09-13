#! /bin/bash
#
# Filename : cleanup_sessions.sh
#
# Purpose  : Remove all session files in an Odoo installation
#
# History  : 2022-09-13 MEY created
#

# Variables used
#
SESSION_FILES_LOCATION="/users/odoo/data/sessions/"

# count the session files and diplay
#
COUNT=`find $SESSION_FILES_LOCATION. -type f | wc -l`
echo "$COUNT session files where found, removing them"

# Cleanup the files and recount
#
find $SESSION_FILES_LOCATION. -type f -delete
COUNT=`find $SESSION_FILES_LOCATION. -type f | wc -l`
echo "$COUNT files found after cleanup"
