#! /bin/bash

# Filename:	load_monthly_usage.sh
#
# Purpose:      load the monthly mobile phone usage file into the database	
#
# History:	
# 2024-08-02	MEY created
# 2024-08-08    MEY adapted, we now use gnumeric to converts xlxs to csv to avoid power notations for small numbers
# ----------------------------------------------------------------------------------------------------------------------------

# Initialize and read parameters from config file
# -----------------------------------------------
directory="$(dirname "$0")"
source $directory/mobile_phone.conf

# Test if the source file exists
# ------------------------------

if [ -f "$data_location/$excel_source" ]; then
  echo "File exists."
  echo "convertion and import will start"
# MEY 2024-08-08  
#  xlsx2csv  $data_location/$excel_source > $data_location/$csv_source
  ssconvert --export-type=Gnumeric_stf:stf_csv  $data_location/$excel_source $data_location/$csv_source_temp

# Convert possible power notation to numeric values
awk 'BEGIN{FS=OFS=","} {for(i=1;i<=NF;i++) if($i ~ /^[0-9]+(\.[0-9]+)?(e|E)[+-]?[0-9]+$/) $i=sprintf("%.15f", $i)} 1' $data_location/$csv_source_temp > $data_location/$csv_source

else
  echo "File does not exist."
  echo "Please provide the correct input file see the readme.txt file"
  exit 0;
fi


# Load the data into the database
# -------------------------------

psql -d $database_name -c "\\COPY $table_name(Year,Month,Phone_nr,Reference,First_name,Name,Company,Dep1,Dep2,Fees,Calls,Duration,Duration_sec,Messages,Kbytes,Amount) FROM '$data_location/$csv_source' DELIMITER ',' CSV"

# Cleanup the data
# ----------------

rm $data_location/$excel_source
rm $data_location/$csv_source
rm $data_location/$csv_source_temp



