#! /bin/bash
# FILENAME: /users/backup/odoo/scripts/sync_filestore.sh
#
# PURPOSE:  sync the filestore of odoo with backup facilities
#
# HISTORY:
# 2024-07-04 MEY created.
# 2024-07-08 MEY integrated into backup system Odoo server
# --------------------------------------------------------------


sync_filestore(){ 

# Retrieve the parameters during the calling of this function
source=$3/
target=$2
database=$1
suffix=$(date +%Y-%m-%d::%H:%M)	

backup_dir=$2filestore/$database
diff_dir=$2/filestore/$database'-diff:'$suffix
# Execute the command 

#rsync -av --delete --backup --suffix=".$suffix" --backup-dir="$backup_dir" "$source" "$target"
rsync -av --delete  --backup --backup-dir=$diff_dir "$source" "$backup_dir"

}
