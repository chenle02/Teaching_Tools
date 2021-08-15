# Workflow
1. Edit file [SolX_Template.tex](SolX_Template.tex) for the meta-data, such as school, year, course
	 number, etc.
2. Edit [homework.wiki](homework.wiki) using vimwiki syntax to indicate the problem set.
4. [Prob.sh](Prob.sh): Use this script to generate homework pdf file.
	*  E.g., `./Prob.sh 3` generates [Problems_HW_3.pdf](Problems_HW_3.pdf)
6. [Jobs.sh](Jobs.sh): Use this sample script file to schedule jobs.
7. [Upload_File.py](Upload_File.py): Python script to upload file to Canvas.
	* Update this file to provide the following information: 
```
# Canvas API URL
API_URL = "..."
# Canvas API key
API_KEY = "..."
# Edit the course nubmers:
dictCourses = {
  "0": xxxxx,
  "1": xxxxx,
  "2": xxxxx,
}
```

# Some other utility files
1. [homework.lua](homework.lua): the file to read wiki files.
2. [saveTable.lua](saveTable.lua): read and save tables (used for debugging only).
3. [command_lualatex.vim]( command_lualatex.vim): Source this file when using vim to compile
	 homework in vim.
