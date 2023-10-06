#!/usr/bin/env bash
# Application that registers students' details into the ALU registration system.

# Function to create student records
create_rec() {
	read -rp "Enter your student email : " student_email
	read -rp "Enter your age : " student_age
	read -rp "Enter your student ID : " student_id
}
# Function to save records to students-list file
output_to_file() {
	echo -e "Student ID: $student_id\tStudent email: $student_email\tStudent age: $student_age" >> "students-list_0923.txt"
}
# Function to view students saved in students-list file
view_recs() {
	if [[ -e "students-list_0923.txt" ]]
	then
		cat "students-list_0923.txt"
	else
		echo "No students saved yet"
	fi
	}
# !!!! ADD OTHER FUNCTIONS HERE

# Main part
while :
do
	echo -e "\nChoose option:\n  'create' to create records\n  'output' to save to students-list file\n  'view' to view students\n  'delete' to delete student from file\n  'update' to update student in list\n  'exit' to exit this application"
	
	read -r option
	case "$option" in
		create) create_rec ;;
		output) output_to_file ;;
		view) view_recs;;
		# !!!! ADD OTHER FUNCTIONS HERE
		*) echo "Usage: main.sh {create|output|view|delete|update|exit}" 
	esac
done
