#- Создать скрипт ownersort.sh, который в заданной папке копирует файлы в директории, названные по имени владельца каждого файла. 
# Учтите, что файл должен принадлежать соответствующему владельцу.



#!/bin/bash

dir=$(ls -l | tr -s ' ' '\t' | cut -f '3' | sort -u)
for i in $dir; do
	mkdir -p $i
done
dirfile=$(ls -l | tr -s ' ' '\t' | cut -f '3 9')
count=0
for i in $dirfile; do
 	count=$((count+1))
		if (($count%2))
			then
				dir=$i
				echo $dir = $i zero
			else
				if [ -f ./$i ]
					then
					cp ./$i ./$dir/$i
				fi
		fi
done