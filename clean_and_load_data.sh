#! /bin/bash

# Filename:	clean_and_load_data.sh
#
# Purpose:	The whipe the data from the table and reload it from scratch with the content of the files containing new data
#
# History:	
# 2024-07-02	MEY created
# ----------------------------------------------------------------------------------------------------------------------------

database_name="datamatrix"
table_name="odoo_logins"
data_location="/users/servers/logfiles/odoo.sirris.be/daily_reports"
file_success="successful_odoo_logins.txt"
file_failed="failed_odoo_logins.txt"

#psql -d sirris-reporting -c "SELECT * FROM odoo_logins"
psql -d $database_name -c "DELETE FROM $table_name"

#psql -d sirris-reporting -c "\\COPY odoo_logins(date,time,status,login,ip_address) FROM '/tmp/odoo/successful_odoo_logins.txt' DELIMITER ' ' CSV"
#psql -d sirris-reporting -c "\\COPY odoo_logins(date,time,status,login,ip_address) FROM '/tmp/odoo/failed_odoo_logins.txt' DELIMITER ' ' CSV"

psql -d $database_name -c "\\COPY $table_name(date,time,status,login,ip_address) FROM '$data_location/$file_success' DELIMITER ' ' CSV"
psql -d $database_name -c "\\COPY $table_name(date,time,status,login,ip_address) FROM '$data_location/$file_failed' DELIMITER ' ' CSV"
