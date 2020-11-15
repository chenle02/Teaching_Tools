#!/usr/bin/env python3
"""
File: Create_Announcement.py
Author: Le Chen
Email: chenle02@gmail.com
Github: https://github.com/chenle02
Description: Use this script to create announcements on several sessions.
"""

import sys
# Count the arguments
# arguments = len(sys.argv) - 1
# print ("The script is called with %i arguments" % (arguments))

announcefile=sys.argv[1]

# announcefile = "./announce_HW1.txt"
print(announcefile)
# Format of the announce file:
#     first line is the tile
#     the rest lines are body.
file=open(announcefile,'r')
lines = file.readlines()

from canvasapi import Canvas

# Canvas API URL
API_URL = "https://canvas.emory.edu"
# Canvas API key
API_KEY = "XXX--to-find-out-XXX"
# Initialize a new Canvas object
canvas = Canvas(API_URL, API_KEY)
# The following are three courses that I am teaching
# Math221-5, Math221-6, Math221-7.
# 0 refers to my sandbox.
dictCourses= {
  "0": 66586,
  "1": 83803,
  "3": 84892,
}

# Initialize courses
courses={}
for key, value in dictCourses.items():
    # if key != "0":
    print("Loading Section", key)
    courses[key] = canvas.get_course(value) # My sandbox
    print(courses[key].name)


# Testing to create an announcement
# Under Discussion Topics API, using announcement_only=true option.
# https://canvas.instructure.com/doc/api/discussion_topics.html
# Test on the Sandbox before posting the announcement for all classes
# It works!
announcementDic={}
announcementDic['is_announcement'] = True
announcementDic['published'] = True
announcementDic['title'] = lines[0]
announcementDic['message'] = ""
for i in range(2,len(lines)):
    announcementDic['message']= announcementDic['message'] + lines[i]

print(announcementDic['message'])

# courses['0'].create_discussion_topic(**announcementDic)
# exit()

# Once the announcement looks good, one can proceed to announce to the rest classes
list=["1","3"]
for i in list:
    print(courses[i].name)
    courses[i].create_discussion_topic(**announcementDic)
# Well done!
