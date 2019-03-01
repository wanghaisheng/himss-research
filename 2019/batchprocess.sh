 #!/bin/bash
Folder_A="/tmp"  
for i in ${Folder_A}/*
do  
    extension=${i##*.}
    if [ "$extension" == "pdf" ]
    then 
    temp_file=`basename $i`  
    echo $temp_file  
    temp_directory=`basename $i .pdf`
    echo $temp_directory
    l_fileCount=`ls ${temp_directory} | wc -l`
    echo "fileCount: ${l_fileCount}"
    if [ ! "$l_fileCount" -gt "0" ]; then
    mkdir  $temp_directory
#   总文件大小7G
#    pdf2htmlEX --embed-css 0 --embed-font 0 --embed-image 0 --embed-javascript 0     --optimize-text 1   --dest-dir   $temp_directory $temp_file
    pdf2htmlEX --embed-image 1 --embed-css 0 --embed-font 1 --embed-javascript 0 --embed-outline 0 --no-drm 0 --dest-dir   $temp_directory $temp_file
    fi
    ##pdf2htmlEX --embed cfijo --dest-dir $temp_directory $temp_file
    fi 
done 