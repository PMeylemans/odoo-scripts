#!/bin/bash

# Filename:  create_odoo_login_data.sh
#
# Pourpose:  Subtract usefull information from the odoo logfiles for further analysis
#
# History:	
# 2024-07-02 MEY created
# -----------------------------------------------------------------------------------

# Variables
filename_failed="/var/log/daily_reports/failed_odoo_logins.txt"
filename_success="/var/log/daily_reports/successful_odoo_logins.txt"

# Create failed logins data
grep -ih 'Login failed' /var/log/odoo/odoo-server.log | grep -iv 'gccw' | cut -d" " -f 1,2,8,11,13 | sed "s/,[0-9]\{3\}//g" | sed "s/login://g" | sort -k1,2 > $filename_failed

# Create successful logins data
zgrep -ih 'Login successful' /var/log/odoo/odoo-server.log.*.gz | grep -iv 'gccw' | cut -d" " -f 1,2,8,11,13 | sed "s/,[0-9]\{3\}//g" | sed "s/login://g" | sort -k1,2 > $filename_success
grep -ih 'Login successful' /var/log/odoo/odoo-server.log.1 | grep -iv 'gccw' | cut -d" " -f 1,2,8,11,13 | sed "s/,[0-9]\{3\}//g" | sed "s/login://g" | sort -k1,2 >> $filename_success
grep -ih 'Login successful' /var/log/odoo/odoo-server.log | grep -iv 'gccw' | cut -d" " -f 1,2,8,11,13 | sed "s/,[0-9]\{3\}//g" | sed "s/login://g" | sort -k1,2 >> $filename_success
