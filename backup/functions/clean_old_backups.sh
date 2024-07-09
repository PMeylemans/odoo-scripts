clean_old_backups(){
	age=$1
	age="+$age"
	bck_dir=$2
	sync_dir="$2/filestore/"

	#echo $age
	#echo $bck_dir
	#result=`find ${bck_dir} -type f -mtime ${age} -name "*.gz" -delete`
	find ${bck_dir} -type f -cmin ${age} -name "*.dmp" -delete
	find ${sync_dir} -maxdepth 1 -type d -cmin ${age} -name "*diff:*" -exec rm -r {} \;
}
