# Some requirement:
1. I am using `lualatex` to compile. You may change that to `pdflatex`
2. You need install `lua` to run the scripts.

# Workflow to generate all slides for the class.
1. Edit [TOC.lua](TOC.lua) file for the meta data.
2. Run [GenSlides.lua](GenSlides.lua) to generate all slides.
3. Run [CompileChapter.sh](CompileChapter.sh) to generate all slides for one chapter. 
4. Run [CompileAll.lua](CompileAll.lua) to generate all slides for the whole course.
	*  It talks 2m13s to compile all slides.
5. Now you can focus on each section latex file. 
