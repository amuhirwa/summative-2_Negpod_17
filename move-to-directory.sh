#!/bin/bash
#shell script to automatically move the all specified files to the "negpod_id-q1" directory.

destination_dir="negpod_17-q1"

if [ ! -d "$destination_dir" ]; then
  mkdir "$destination_dir"
fi

files_to_move=("main.sh" "students-list_0923.txt" "select-emails.sh" "student-emails.txt")

for file in "${files_to_move[@]}"; do
  if [ -e "$file" ]; then
    mv "$file" "$destination_dir"
    echo "Moved $file to $destination_dir/"
  else
    echo "$file does not exist in the current directory."
  fi
done



