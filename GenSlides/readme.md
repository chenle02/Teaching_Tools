# Generate skelton of slides for a course with several chapters and sections
	* Le Chen
	* 2021-05-17 Mon 09:30:41
## Usage:
1. Edit [Title.tex](Title.tex) for title, author, and affiliations.
2. Edit [toc.lua](toc.lua) for the table of content.
3. Run `toc.lua` to generate `toc.table` file, which will be used in the next step.
4. Run `GenSlides.lua` to generate 'Chapter-#.conf' files and section files.
	* Be careful in running this file. It will overwrite the working files: Section_#-#.tex.
5. Finally, run `GenChapter.sh #` to generate slides for Chapter #.
6. If you use vim, [command.vim](command.vim) give some useful commands to compile and show pdf
	 files.
