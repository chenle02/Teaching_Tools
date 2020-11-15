#!/usr/bin/env python3
"""
File: Week_Module.py
Author: Le Chen
Email: chenle02@gmail.com
Github: https://github.com/chenle02
Description: Batch create modules for the whole semester.
    Here, I create 16 modules, with names Week 0 to Week 15.
"""
from canvasapi import Canvas
# Canvas API URL
API_URL = "https://canvas.emory.edu"
# Canvas API key
API_KEY = "XXX--to-find-out-XXX"
# Initialize a new Canvas object
canvas = Canvas(API_URL, API_KEY)

dictCourses= {
  "0": 66586, # This is my sandbox
  "1": 83803, # Math 221-1 & 2, cross-listed together
  "3": 84892, # Math 221-3 & 4, cross-listed together
}

# Initialize courses
courses={}
for key, value in dictCourses.items():
    # if key != "0":
    print("Loading Course", key)
    courses[key] = canvas.get_course(value) # My sandbox
    print(courses[key].name)

# Create Modules for course "1" and "3" now:
for i in range(16):
    moduleDic={
            "name": "Week "+str(i),
            "position": i,
            "require_sequential_progress": False,
            "publish_final_grade": False,
            "published": True}
    print(moduleDic["name"])
    for j in ["1","3"]:
        courses[j].create_module(moduleDic)
