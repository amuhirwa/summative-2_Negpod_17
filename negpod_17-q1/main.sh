#!/usr/bin/env bash
# Application that registers students' details into the ALU registration system.

# Function to create student records
create_rec() {
	read -rp "Enter your student email : " student_email
	read -rp "Enter your age : " student_age
	read -rp "Enter your student ID : " student_id
	s_email=$(echo $student_email | tr -d ' ')
	s_age=$(echo $student_age | tr -d ' ')
	s_id=$(echo $student_id | tr -d ' ')
	echo "Student record created successfully"
	echo "Choose 'output' option to save record to file"
}
# Function to save records to students-list file
output_to_file() {
	echo -e "Student ID: $s_id\tStudent email: $s_email\tStudent age: $s_age" >> "students-list_0923.txt"
	echo "Record saved to file successfully"
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
# Function to delete student record using student id
delete() {
        read -rp "Which student would you like to delete?(Enter student ID) : " delete_id
	if (( $(grep -cP "Student ID: $delete_id[^[[:digit:]]]*" < "students-list_0923.txt") >= 1))
	then	
	        sed -i "/Student ID: $delete_id[^[[:digit:]]]*/d" "students-list_0923.txt"
		echo "Student $delete_id has been deleted successfully"
	else
		echo "Student with student ID: $delete_id not found for deletion"
	fi
	}
# Function to update student record using student id 
update() {
        read -rp "Which student would you like to update?(Enter student ID) : " update_id
	if (( $(grep -cP "Student ID: $update_id[^[[:digit:]]]*" < "students-list_0923.txt") >= 1))
        then
        	read -rp "Enter new email : " new_email
        	read -rp "Enter new age : " new_age
        	sed -i "s/Student ID: $update_id\t.*/Student ID: $update_id\tStudent email: $new_email\tStudent age: $new_age/" "students-list_0923.txt"
		echo "Student with student ID: $update_id has been updated successfully"
	else
		echo "Student with student ID: $update_id not found to update"

	fi
}
# Function to exit application
exit_app(){
        exit
}

# Main part
while :
do
	echo -e "\nChoose option:\n  'create' to create records\n  'output' to save to students-list file\n  'view' to view students\n  'delete' to delete student from file\n  'update' to update student in list\n  'exit' to exit this application"
	
	read -r option
	case "$option" in
		create) create_rec ;;
		output) output_to_file ;;
		view) view_recs;;
		delete) delete ;;
		update) update ;;
		exit) exit_app ;;
		*) echo "Usage: main.sh {create|output|view|delete|update|exit}" 
	esac
done
