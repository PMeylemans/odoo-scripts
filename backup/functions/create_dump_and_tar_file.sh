# Filename : /users/odoo/backup/scripts/backup/functions/create_dump_and_tar_file.sh
#
# Purpose  : Create a dumpfile of the databsese and create a tar file in case it is an ODOO database
#
# History  :
# 2020-01-24 Mey created
#
create_dump_and_tar_file (){

	db_name=$1
	backup_dir=$2
        odoo_files_location=$3

	# Prepare the variables
	#

	Time_stamp="$(date +%F)_$(date +%H-%M-%S)"
	full_dump_name="$backup_dir$db_name-$Time_stamp.dmp.gz"
	full_tar_name="$backup_dir$db_name-$Time_stamp.tar.gz"
	
	# Create the dumpfile
	#
	
	dump_result=`pg_dump ${db_name} | gzip > ${full_dump_name}`

	# Check if the target file location exist (only the case with odoo databases)
	# If the directory exist make tarfile with the -C option for easy restore operation
        #

	if [ -d "$odoo_files_location" ]
	then
		#echo "the directory $odoo_files_location exsists"
	        #echo $full_tar_name	
		tar_result=`tar cf ${full_tar_name} --gzip -C ${odoo_files_location} .`
	fi

	#echo $db_name
	#echo $backup_dir
	#echo $target_file_location
}

