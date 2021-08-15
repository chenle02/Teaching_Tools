#!/usr/bin/env sh

# Section 5. 11:20--12:10
# at -f ./Sending_emails_S5_Step1.sh -t 10021110.00
# echo "./Upload_File.py 6 60 Test_2.pdf Test02-Phase-II-Problems" | at -t 03051800.00

# echo "./Email_final.lua Math221.csv " | at -t 05060750.00

# Send the following command to the folder:
# ~/Dropbox/Teaching/svn_teaching/2021_Spring_Math362/Announcement

# The followings are a sample script.

cd ~/Dropbox/Teaching/svn_teaching/2021_Spring_Math362/Announcement

echo "./Create_Announcement.py 0507_ExamStarts.txt yes" | at -t 05070755.00
echo "./Create_Announcement.py 0508_Exam3hourReminder.txt yes" | at -t 05080500.00
echo "./Create_Announcement.py 0508_halfhourreminder.txt yes" | at -t 05080730.00
echo "./Create_Announcement.py 0508_FinalDone.txt yes" | at -t 05080800.00

# Send the following command to the current folder

cd ~/Dropbox/Teaching/svn_teaching/2021_Spring_Math362/Homework/Phase-II/

echo "./Upload_File.py 15 3 Problem_Final.pdf Final-Phase-II-Only" | at -t 05070757.00

