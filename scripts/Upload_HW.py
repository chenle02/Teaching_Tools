#!/usr/bin/env python3
"""
File: Upload_HW.py
Author: Le Chen
Email: chenle02@gmail.com
Github: https://github.com/chenle02
Description: Use this script to upload pdf file to Canvas file folder
    and show it on the module page.
"""
from canvasapi import Canvas
# Canvas API URL
API_URL = "https://canvas.emory.edu"
# Canvas API key
API_KEY = "XXX--to-find-out-XXX"
# Initialize a new Canvas object
canvas = Canvas(API_URL, API_KEY)
# Test the course setting
import sys
if len(sys.argv) != 3:
    print("Give an integer to indicate which week and another integer for the position")
    sys.exit(2)


filename = "Problems_HW_"+sys.argv[1] + ".pdf"
weeknumber = "Week " + sys.argv[1] # This appears in the Module name. Week one/ Week 2, etc.
position = sys.argv[2]
# weeknumber = weeknumber.strip()

print("Uploading problems set for week", sys.argv[1])
print(weeknumber+":",filename)

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


# # Create folders Homework when run this for the first time
# for key, value in dictCourses.items():
#     # if key != "0":
#     print("Creating Homework folder for", courses[key].name)
#     courses[key].create_folder("Homework",parent_folder_path="/")

# Add the file to the Homework folder
for key, value in dictCourses.items():
    print("Uploading files to ", courses[key].name)
    courses[key].upload(filename,parent_folder_path="Homework")

# Uncomment the following line to just upload files
# sys.exit(1)

# Add it to the correct module.
moduleDic={
        "position": 1,
        "require_sequential_progress": False,
        "publish_final_grade": False,
        "published": True}
moduleDic['name'] = weeknumber


# Step 2: Add page items:
module_item = {
        "type": "File",
        "position": sys.argv[2],
        "indent": 0
        }
# module_item["position"] = position
# sys.exit(1)

# First test on Sandbox
modules = courses['0'].get_modules()
for module in modules:
    if weeknumber in module.name:
        print("Found the module:", module.name)
        files = courses['0'].get_files(order="asc",per_page=50,sort="title")
        for file in files:
            if filename in file.display_name:
                print(file.display_name)
                module_item["content_id"] = file.id
                module_item["page_url"] = file.url
                module_item["title"] = file.display_name
                print("Create a module items now...")
                module.create_module_item(module_item)
# Well done!


# Now do the rest three
list=["5","6","7"]
for i in list:
    print(courses[i].name)
    modules = courses[i].get_modules()
    for module in modules:
        if weeknumber in module.name:
            print("Found the module:", module.name)
            files = courses[i].get_files(order="asc",per_page=50,sort="title")
            for file in files:
                if filename in file.display_name:
                    print(file.display_name)
                    module_item["content_id"] = file.id
                    module_item["page_url"] = file.url
                    module_item["title"] = file.display_name
                    print("Create a module items now...")
                    module.create_module_item(module_item)
# Well done!
