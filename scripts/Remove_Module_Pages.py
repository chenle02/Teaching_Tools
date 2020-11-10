#!/usr/bin/env python3
"""
File: Remove_Module_Pages.py
Author: Le Chen
Email: chenle02@gmail.com
Github: https://github.com/chenle02
Description: Use this script to remove module pages.
    Run ./Copy_ExternalTools_test.py first to show positions.
    Then run this script with care.
    Once some pages are removed, you cannot restore them back.
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

# Here are the arguments
# Use ./Copy_ExternalTools_test.py to list the positions.
# Course='7'
positions = list(range(24,38)) # [3,...,11]
TitleSearchStr = "Week 12" # To uniquely locate the module

for i in ["0"]:
    modules = courses[i].get_modules()
    print(courses['0'].name)
    for module in modules:
        if TitleSearchStr in module.name:
            print("Updating module: ", module.name)
            mod_items = module.get_module_items()
            for moditem in mod_items:
                print(moditem.title, " : ", moditem.position)
                if moditem.position in positions:
                    print("Position ", moditem.position, "found...")
                    print("title:", moditem.title)
                    print("Deleting ", moditem.title)
                    moditem.delete()
# Succeeded!
