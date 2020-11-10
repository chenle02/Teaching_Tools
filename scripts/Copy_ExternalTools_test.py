#!/usr/bin/env python3
"""
File: Copy_ExternalTools_test.py
Author: Le Chen
Email: chenle02@gmail.com
Github: https://github.com/chenle02
Description: This script is used to list all positions of a course under module pages with title
    given by, eg., "Week 12".
"""
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
  "5": 79158,
  "6": 76203,
  "7": 78323
}
# Initialize courses
courses={}
for key, value in dictCourses.items():
    # if key != "0":
    print("Loading Section", key)
    courses[key] = canvas.get_course(value) # My sandbox
    print(courses[key].name)

# Copy based on the position.
# positions = [1,2,3,4,5,6,7,8]
# positions = [9,10]
# positions = [13,14,15,16]
TitleSearchStr = "Week 12" # To uniquely locate the module
# modules = courses['0'].get_modules()
# print(courses['0'].name)

for i in ["0","5","6","7"]:
    modules_des = courses[i].get_modules()
    for module_des in modules_des:
        if TitleSearchStr in module_des.name:
            print("Section", i)
            mod_items = module_des.get_module_items()
            for moditem in mod_items:
                print("Pos: ", moditem.position, "title:", moditem.title)
            print("\n")

