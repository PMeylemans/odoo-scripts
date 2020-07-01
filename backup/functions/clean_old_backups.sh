clean_old_backups(){
	age=$1
	age="+$age"
	bck_dir=$2

	#echo $age
	#echo $bck_dir
	#result=`find ${bck_dir} -type f -mtime ${age} -name "*.gz" -delete`
	find ${bck_dir} -type f -cmin ${age} -name "*.gz" -delete
}
