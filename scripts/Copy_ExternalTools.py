#!/usr/bin/env python3
"""
File: Copy_ExternalTools.py
Author: Le Chen
Email: chenle02@gmail.com
Github: https://github.com/chenle02
Description:
        One first modify module pages on Sandbox, which is course "0" below.
        Then one can copy these to the other courses, "5"--"7".
        One needs to specify the title of the Module Page, which is "Week 12".
        One needs to specify the positions.
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
# positions = [1]
# positions = [17]
# positions = [2,3,4]
# positions = [8,9,10,11]
# positions = [4,21]
# positions = list(range(1,11)) # [3,...,11]
# positions = list(range(11,17)) # [3,...,11]
# positions = list(range(21,31)) # [3,...,11]
# positions = list(range(14,20)) # [3,...,11]
# positions = list(range(12,16)) # [3,...,11]
# positions = list(range(6,26)) # [3,...,11]
positions = list(range(10,24)) # [3,...,11]
# positions = [13,14,15,16]
# positions = [14]
TitleSearchStr = "Week 12" # To uniquely locate the module
TitleSearchStr_wrong = "Week 12" # To uniquely locate the module
modules = courses['0'].get_modules()
print(courses['0'].name)
for module in modules:
    if TitleSearchStr_wrong in module.name:
        print("Updating module: ", module.name)
        mod_items = module.get_module_items()
        for moditem in mod_items:
            print(moditem.title, " : ", moditem.position)
            if moditem.position in positions:
                print("Position ", moditem.position, "found...")
                print("title:", moditem.title)
                module_item={}
                module_item["title"] = moditem.title
                module_item["type"] = moditem.type
                module_item["position"] = moditem.position
                module_item["indent"] = moditem.indent
                module_item["content_id"] = moditem.content_id
                try:
                    module_item["external_url"] = moditem.external_url
                except AttributeError:
                    print("There is no external_url in this module item")
                try:
                    module_item["page_url"] = moditem.page_url
                except AttributeError:
                    print("There is no page_url in this module item")
                try:
                    module_item["new_tab"] = moditem.new_tab
                except AttributeError:
                    print("There is no new_tab in this module item")
                # module_item["new_tab"] = moditem.new_tab
                print(module_item)
                for i in ["5","6","7"]:
                    modules_des = courses[i].get_modules()
                    for module_des in modules_des:
                        if TitleSearchStr in module_des.name:
                            print("Adding to Section", i)
                            module_des.create_module_item(module_item)


# Succeeded!
# In the future, write one module on Sandbox and then run this script to copy to the other three courses.
