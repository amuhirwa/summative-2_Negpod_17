#!/bin/bash
#shell script to automatically move the all specified files to the "negpod_4-q1" directory
destination_dir="negpod_id-q1"

if [ ! -d "$destination_dir" ]; then
  mkdir "$destination_dir"
fi

files_to_move=("main.sh" "Students-list_0923.txt" "Select-emails.sh" "student-emails.txt")

for file in "${files_to_move[@]}"; do
  if [ -e "$file" ]; then
    mv "$file" "$destination_dir"
    echo "Moved $file to $destination_dir/"
  else
    echo "$file does not exist in the current directory."
  fi
done
=======

# Create the directory if it doesn't exist before
mkdir -p negpod_id-q1

# Move the files to the directory
mv main.sh students-list_0923.txt select-emails.sh student-emails.txt negpod_id-q1

echo "Files moved to negpod_id-q1 directory."


~                                                                                                                                                   ~                                                                                                                                                   ~                                                                                                                                                 
