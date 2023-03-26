#!/usr/bin/env fish

set folder_id "YOUR_FOLDER_ID"
set folder_path "/path/to/your/folder"

gdrive upload -r $folder_id $folder_path
