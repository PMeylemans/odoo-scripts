dump_globals(){
	filename=$2
	global_dump_file="$1$filename"

	pg_dumpall --globals-only > $global_dump_file
	#echo $global_dump_file
}
