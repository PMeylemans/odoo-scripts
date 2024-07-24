#! /bin/bash
#
# Filename : /users/cron/scripts/odoo/sync_odoo_logins.sh
#
# Purlpose : sync the Odoo logfiles to a local folder
#
# History  : 
# 2024-07-01 Mey copied from /users/cron/scripts/odoo/sync_odoo_logfiles.sh and apated

rsync -av --exclude=journal* -e ssh root@odoo.sirris.be:/var/log/daily_reports /users/servers/logfiles/odoo.sirris.be/. --delete
