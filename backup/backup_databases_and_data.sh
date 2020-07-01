#! /bin/bash
#
# Filename: backup_databases_and_data.sh
#
# Purpose : To automate the backup of all databases on the system
#
# History :
# 2020-01-22 MEY created
# 2020-01-23 MEY adapted, use the directory function (location scripts)
# 2020-01-30 MEY add the function to dump the globals of postgresql database
# ---------------------------------------------------------------------

# Get the location of this script, used files are relative to this directory
#
directory="$(dirname "$0")"

# Read the parameters of the programm
#
source $directory/backup.conf

# Load the used functions (procedures)
#
source $directory/functions/create_dump_and_tar_file.sh
source $directory/functions/clean_old_backups.sh
source $directory/functions/dump_globals.sh

# Get the list of the databases on the system
#

db_list=($(psql template1 -Uodoo -t -c "select datname from pg_database"))
#echo ${db_list[@]}

# Process the databases to be excluded as defined in backup.conf
#
nmbr_of_dbs_to_exclude=${#db_to_exclude[@]}

# Loop through all databases and check for exclusion
#

nmbr_of_dbs=${#db_list[@]}
n=0
while [ $n -lt $nmbr_of_dbs ]
do
	exclude=0
	x=0

	# Check for excluded databases
	#

	while [ $x -lt $nmbr_of_dbs_to_exclude ]
	do
		if [ "${db_list[$n]}" =  "${db_to_exclude[$x]}" ]
	       	then
			exclude=1
		fi
        let 'x = x +1'
	done

	if [ $exclude -eq 0 ]
       	then
		#echo ${db_list[$n]}
		#echo "call backup procedures"
		create_dump_and_tar_file "${db_list[$n]}" "$backup_target_location" "$source_file_location${db_list[$n]}"
	fi

	exclude=0
	let 'n = n +1'
done

# Dump the globals of the databases (PostgreSQL)
#

dump_globals "$backup_target_location" "globals.dmp"

# Clean up the old backups
#

clean_old_backups "$time_to_keep" "$backup_target_location"

exit 0

