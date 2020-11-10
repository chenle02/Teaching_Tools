![Lua Land](Gel-on-Moon.jpg)

# Teaching Tools and My Setups
 
Hera are some tools that I am using for teaching [Math 221, Fall 2020](http://math.emory.edu/~lchen41/teaching/2020_Fall/math221_2020_Fall.html).

## Use _Text2qti_ to handle Canvas Quiz, homework and exams
1. Here is the [Text2qti]( https://github.com/gpoore/text2qti/tree/8e16684fe18dbcacec1474fbde8e9bfeef4c5838)  on Github.
2. There are several examples on the Github page.
3. Here are some more examples:
    * [Sample Homework](scripts/SampleHomework.md.tex) which includes
	    * Five groups of problems. Each group contains 3-4 problems.
	    * One picks randomly one or two problems from each group.
	    * Ten points for each problem.
    * If you use [vim or neovim](https://github.com/neovim/neovim), source the file [comand_qti.vim](scripts/command_qti.vim) where
	    * the fold method is set to `:set foldmethod=marker`
	    * The command `<leader><leader>` under normal mode will remove unnecessary `{{{` from the fold method to generate file without `.tex`
		and then it will run `text2qti` the newly generated file (without `.tex`) to generate a file with `.zip`.
	    * Now you can upload `.zip` file to Canvas.
	    * These steps are shown by [SampleHomework.md.tex](scripts/SampleHomework.md.tex) --> [SampleHomework.md](scripts/SampleHomework.md) --> [SampleHomework.zip](scripts/SampleHomework.zip) 
	    * Then you need to upload this to Canvas following the steps here: [How do I import quizzes from QTI packages? - Canvas Community](https://community.canvaslms.com/t5/Instructor-Guide/How-do-I-import-quizzes-from-QTI-packages/ta-p/1046)
4. Here are some more tricks that I am using to speed up the process.
    * Use [qutebrowser](https://github.com/qutebrowser/qutebrowser) as the web browser.
    * Create the quickmarks first 
```sh
m0 https://emory.instructure.com/courses/66586/modules
m1 https://emory.instructure.com/courses/83803/modules
m2 https://emory.instructure.com/courses/83638/modules
m3 https://emory.instructure.com/courses/84892/modules
m4 https://emory.instructure.com/courses/84083/modules
m5 https://emory.instructure.com/courses/79158/modules
m6 https://emory.instructure.com/courses/76203/modules
m7 https://emory.instructure.com/courses/78323/modules
a0 https://emory.instructure.com/courses/66586/announcements
a1 https://emory.instructure.com/courses/83803/announcements
a2 https://emory.instructure.com/courses/83638/announcements
a3 https://emory.instructure.com/courses/84892/announcements
a4 https://emory.instructure.com/courses/84083/announcements
a5 https://emory.instructure.com/courses/79158/announcements
a6 https://emory.instructure.com/courses/76203/announcements
a7 https://emory.instructure.com/courses/78323/announcements
q0 https://emory.instructure.com/courses/66586/quizzes
q1 https://emory.instructure.com/courses/83803/quizzes
q2 https://emory.instructure.com/courses/83638/quizzes
q3 https://emory.instructure.com/courses/84892/quizzes
q4 https://emory.instructure.com/courses/84083/quizzes
q5 https://emory.instructure.com/courses/79158/quizzes
q6 https://emory.instructure.com/courses/76203/quizzes
q7 https://emory.instructure.com/courses/78323/quizzes
s0 https://emory.instructure.com/courses/66586/assignments/syllabus
s1 https://emory.instructure.com/courses/83803/assignments/syllabus
s2 https://emory.instructure.com/courses/83638/assignments/syllabus
s3 https://emory.instructure.com/courses/84892/assignments/syllabus
s4 https://emory.instructure.com/courses/84083/assignments/syllabus
s5 https://emory.instructure.com/courses/79158/assignments/syllabus
s6 https://emory.instructure.com/courses/76203/assignments/syllabus
s7 https://emory.instructure.com/courses/78323/assignments/syllabus
```
* Create Zsh alias function to open all courses side by side
```sh
qba_fall() {
    qutebrowser ":quickmark-load -t a5 ;; tab-give"
    qutebrowser ":quickmark-load -t a6 ;; tab-give"
    qutebrowser ":quickmark-load -t a7 ;; tab-give"
    }
qba_spring() {
    qutebrowser ":quickmark-load -t a1 ;; tab-give"
    qutebrowser ":quickmark-load -t a2 ;; tab-give"
    qutebrowser ":quickmark-load -t a3 ;; tab-give"
    qutebrowser ":quickmark-load -t a4 ;; tab-give"
    }
qbq_fall() {
    qutebrowser ":quickmark-load -t q0 ;; tab-give"
    qutebrowser ":quickmark-load -t q5 ;; tab-give"
    qutebrowser ":quickmark-load -t q6 ;; tab-give"
    qutebrowser ":quickmark-load -t q7 ;; tab-give"
    }
qbq_spring() {
    qutebrowser ":quickmark-load -t q0 ;; tab-give"
    qutebrowser ":quickmark-load -t q1 ;; tab-give"
    qutebrowser ":quickmark-load -t q2 ;; tab-give"
    qutebrowser ":quickmark-load -t q3 ;; tab-give"
    qutebrowser ":quickmark-load -t q4 ;; tab-give"
    }

qbm_fall() {
    qutebrowser ":quickmark-load -t m0 ;; tab-give"
    qutebrowser ":quickmark-load -t m5 ;; tab-give"
    qutebrowser ":quickmark-load -t m6 ;; tab-give"
    qutebrowser ":quickmark-load -t m7 ;; tab-give"
    }
qbm_spring() {
    qutebrowser ":quickmark-load -t m0 ;; tab-give"
    qutebrowser ":quickmark-load -t m1 ;; tab-give"
    qutebrowser ":quickmark-load -t m2 ;; tab-give"
    qutebrowser ":quickmark-load -t m3 ;; tab-give"
    qutebrowser ":quickmark-load -t m4 ;; tab-give"
    }
qbs_fall() {
    qutebrowser ":quickmark-load -t s5 ;; tab-give"
    qutebrowser ":quickmark-load -t s6 ;; tab-give"
    qutebrowser ":quickmark-load -t s7 ;; tab-give"
    }
qbs_spring() {
    qutebrowser ":quickmark-load -t s1 ;; tab-give"
    qutebrowser ":quickmark-load -t s2 ;; tab-give"
    qutebrowser ":quickmark-load -t s3 ;; tab-give"
    qutebrowser ":quickmark-load -t s4 ;; tab-give"
    }
alias qbwin_only='qutebrowser ":window-only"'
``` 

## Use _Vimwiki_ to generate the course html pages
1. Here is the [Vimwiki](https://github.com/vimwiki/vimwiki) on GitHub.
2. Here are some examples:
    1. [Math 221, Fall](http://math.emory.edu/~lchen41/teaching/2020_Fall/math221_2020_Fall.html)
    1. [Math 221, Spring](http://math.emory.edu/~lchen41/teaching/2021_Spring/math221_2021_Spring.html)
3. Include the following code on Canvas syllabus page
```HTML
<p>If you cannot see the page, this might be because your browser has blocked notifications. You can turn to ``Allow". Otherwise, you can always refer the course page here</p>
<p><a href="http://math.emory.edu/~lchen41/teaching/2020_Fall/math221_2020_Fall.html">http://math.emory.edu/~lchen41/teaching/2020_Fall/math221_2020_Fall.html</a></p>
<hr>
<p><iframe id="iframeid" src="https://math.emory.edu/~lchen41/teaching/2020_Fall/math221_2020_Full.html" width="100%" height="3800"></iframe></p>
```
4. To include a iframe (youtube video) on the course page, use the following commands to post
   process your index.html file that is generated by vimwiki:
```sh
$ sed -i 's/<code>&lt;/</g' $file
$ sed -i 's/&gt;&lt;\/iframe&gt;<\/code>/><\/iframe>/g' $file
```
5. To generate the wordcloud on the course page, install [word_cloud](https://github.com/amueller/word_cloud) and run:
```sh
$ wordcloud_cli --text vimwiki/index.wiki --imagefile vimwiki_html/wordcloud.png
```
6. Generate the pichart for the weight, the file is using [weights.r](scripts/weights.r)
```sh
$ Rscript weights.r
```

## Use _Canvas API_ to access and handle Canvas pages.
1. Canvas API is specified here: [Cavnas LMS](https://canvas.instructure.com/doc/api/) 
2. Here is a convenient Python wrapper for this API: [canvasapi](https://github.com/ucfopen/canvasapi)
3. The first thing is to obtain the `Canvas API KEY`. For this following the steps here:
    * [How do I obtain an API access token in the Canvas Data Portal?](https://community.canvaslms.com/t5/Admin-Guide/How-do-I-obtain-an-API-access-token-in-the-Canvas-Data-Portal/ta-p/157)
5. Extract students emails using the script [list_student.sh](scripts/list_students.sh)
    * This script also produces alias file for [neomutt](https://neomutt.org/)
    * One can write scripts to schedule sending emails.
    * Use [at](https://linuxize.com/post/at-command-in-linux/) to make the schedule.
7. A script to make announcements from terminal [Create_Announcement.py](scripts/Create_Announcement.py)
8. A script to upload Homework to Canvas and show it on Module Page: [Upload_HW.py](./scripts/Upload_HW.py)
9. A script to copy modules pages: [Copy_ExternalTools.py](./scripts/Copy_ExternalTools.py) 
10. A script to list modules pages: [Copy_ExternalTools_test.py](./scripts/Copy_ExternalTools_test.py)
12. A script to remove modules pages: [Remove_Module_Pages.py](./scripts/Remove_Module_Pages.py)

## Dark mode of the slides
1. Using [Khan Academic colors](https://support.khanacademy.org/hc/en-us/articles/226885367-How-do-I-recreate-Khan-Academy-videos-):
    * White:      #FFFFFF
    * Pink:       #FB73BE
    * Coral:      #FF8D71
    * Yellow:     #FFE066
    * Teal:       #59F3CE
    * Light blue: #65D0FA
    * Blue:	  #4984F2
    * Purple: 	  #A87DFF
2. Beamer dark theme: [DBT](https://github.com/pblottiere/dark-beamer-theme)
3. Below are some example slides (see the [course page](http://math.emory.edu/~lchen41/teaching/2020_Fall/math221_2020_Fall.html) for a complete set of slides for the class of linear algebra)
 
| Chapter/Section                               | Slides                                                                                        | Slides                                                                              |
|-----------------------------------------------|-----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Section 3-2. Determinants and Matrix Inverses | [presentation](http://math.emory.edu/~lchen41/teaching/2020_Fall/Slides_3-2-Presentation.pdf) | [handout](http://math.emory.edu/~lchen41/teaching/2020_Fall/Slides_3-2-Handout.pdf) |
| Section 3-3. Diagonalization and Eigenvalues  | [presentation](http://math.emory.edu/~lchen41/teaching/2020_Fall/Slides_3-3-Presentation.pdf) | [handout](http://math.emory.edu/~lchen41/teaching/2020_Fall/Slides_3-3-Handout.pdf) |
4. I wrote this script [split.lua](scripts/split.lua) to split the textbook into sections as shown on my [course page](http://math.emory.edu/~lchen41/teaching/2020_Fall/index.html#MATH%20221:%20Linear%20Algebra-2020%20Fall,%20Emory%20University-Text%20and%20slides).

# Video processing and animation
This part is very sketchy right now. I may elaborate it more in the future.
1. Use the Python package [manim](https://github.com/3b1b/manim) by _3 Blue 1 Brown_ to generate animation videos.
    * Here are some [examples]( https://talkingphysics.wordpress.com/2019/01/08/getting-started-animating-with-manim-and-python-3-7/ ) to walk through.
2. The video file should be `mmdd_S#.mp4`, `#` be replaced by `5,6,7`.
3. `cp 0917_S6_content.txt mmdd_S#_content.txt` Edit the this content file for the section names and etc.
4. `cp SA-B.txt SA-B_S#.txt` with A-B means Section A.B.
5. Edit `SA-B_S#.txt` and run `./GenTitleVideo.sh SA-B_S#` (without extension) to generate the title videos
6. Finally, run `./splitvideo.lua mmdd_S# mmdd_S#_content.txt` to see the command to be executed. If all looks good, run
```sh
$ splitvideo.lua mmdd_S# mmdd_S#_content.txt yes
```
7. Here is the script [splitvideo lua](scripts/splitvideo.lua). This script depends on 
    1. [manim](https://github.com/3b1b/manim): used to generate the animation title videos.
    2. [ffmpeg](https://ffmpeg.org/): used to split long course videos to short ones.
    3. [MP4Box](https://github.com/gpac/gpac/wiki/MP4Box): used to combine animation video (without sound track with my course videos)

## Markdown related
1. Use [Grip](https://github.com/joeyespo/grip) to see how the Markdown file looks on Github.
    * Once it is installed, cd into the directory of the Markdown files. Then run `grip`.
    * Open a browser with the following link: [http://localhost:6419/](http://localhost:6419/).
    * It seems that the free version allows you to use 60 requests per hour.
2. Or one can use [Pandoc](https://pandoc.org/) to convert README.md to index.html by running (this only gives an approximate view)
```sh
$ pandoc -s README.md -o ./site_html/index.html
```
## Other misc tools
I am running Linux -- Ubuntu 20.10. Here are a list of tools that are handy, many of which can also run under Windows or Mac OS:
12. The shell: [ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) and its [awesome plugins](https://github.com/unixorn/awesome-zsh-plugins)
2. [tmux](https://github.com/tmux/tmux/wiki) + [neovim](https://github.com/neovim/neovim) + [awesome window manager](https://awesomewm.org/) + [Lualatex](http://www.luatex.org/) + Writing scripts in Lua = "Congratulations! You are on Lua Land now!"
1. [fzf: A command-line fuzzy finder](https://github.com/junegunn/fzf)
9. [lazygit: simple terminal UI for git commands](https://github.com/jesseduffield/lazygit) and [tig: Text-mode interface for git](https://github.com/jonas/tig)
13. [vifm: Vifm is a file manager with curses interface, which provides Vi[m]-like environment for managing objects within file systems, extended with some useful ideas from mutt.](https://github.com/vifm/vifm)
4. [Rofi: A window switcher, application launcher and dmenu replacement](https://github.com/davatorium/rofi)
7. [qutebrowser/qutebrowser: A keyboard-driven, vim-like browser based on PyQt5.](https://github.com/qutebrowser/qutebrowser)
5. [calcurse: A text-based calendar and scheduling application](https://github.com/lfos/calcurse)
10. [neomutt](https://github.com/neomutt/neomutt) configured through [LukeSmithxyz/mutt-wizard: A system for automatically configuring mutt and isync with a simple interface and safe passwords](https://github.com/LukeSmithxyz/mutt-wizard), which integrates _abook_ below as the address book.
11. [abook: CLI Address book](https://github.com/hhirsch/abook)

