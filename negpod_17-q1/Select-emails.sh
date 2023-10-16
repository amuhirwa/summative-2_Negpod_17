#!/bin/bash
# Use cut to extract student emails and save them to student-emails.txt
grep -oE '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}' students-list_0923.txt | sort > student-emails.txt
echo "Student emails extracted and saved to student-emails.txt"

