#!/usr/bin/env python
"""
File: math221.py
Author: Le Chen
Email: chenle02@gmail.com
Github: https://github.com/chenle02
Description: Use this script to generate title animation page.
    : First modify the hidden file .Section_X.txt which takes the following format:
    ---
Section: 5
Date: 11/10/2020
Content: 8.1 Orthogonal Complements and Projections \\ -- Projection as a Transformation
Latex: \text{dim}(U)+\text{dim}(U^{\perp})=n
    ---
    : Then run the following command:
    : python3 -m manim math221.py Section_X
    : The video file is generated under 
    : ./media/videos/math221/1440p60/Section_X.mp4
    : This python file is called from ./GenTitleVideo.sh
Note: Make sure that install manim first and make a symbolic link to manim.py at the working folder
"""

from manimlib.imports import *
import os
import pyclbr

# To watch one of these scenes, run the following:
# python -m manim example_scenes.py SquareToCircle -pl
#
# Use the flat -l for a faster rendering at a lower
# quality.
# Use -s to skip to the end and just save the final frame
# Use the -p to have the animation (or image, if -s was
# used) pop up once done.
# Use -n <number> to skip ahead to the n'th animation of a scene.
# Use -r <number> to specify a resolution (for example, -r 1080
# for a 1920x1080 video)

class Section_X(Scene):
    def construct(self):
        f = open('Section.txt', 'r')
        Lines = f.readlines()
        f.close()
        # count=0
        # for line in Lines:
        #     print("Line{}: {}".format(count, line.strip()))
        print(Lines[0].strip().replace("Section: ",""))
        print(Lines[1].strip().replace("Date: ", ""))
        print(Lines[2].strip().replace("Content: ",""))
        print(Lines[3].strip().replace("Latex: ",""))
        Lines[0] = Lines[0].strip().replace("Section: ","")
        Lines[1] = Lines[1].strip().replace("Date: ", "")
        Lines[2] = Lines[2].strip().replace("Content: ","")
        Lines[3] = Lines[3].strip().replace("Latex: ","")

        # ------
        SessionNo = Lines[0]
        Date = Lines[1]
        title = TextMobject(
                "{}".format(Lines[2])
                )
        title.set_color(MAROON_C)
        latex = TexMobject(
            "{}".format(Lines[3])
            )

        # ------
        group = VGroup(title, latex)
        group.arrange(DOWN)
        self.play(
            Write(title),
            FadeInFrom(latex, DOWN),
        )
        self.wait()

        transform_title = TextMobject(
                "Math 221: Linear Algebra "
                "(Emory, Fall 2020)"
                )
        transform_title.set_color(GREEN_C)
        session_title = TextMobject(
                "Synchronous session for Section " + SessionNo + " \\\\"
                "{0}".format(Date)
                )
        session_title.set_color(YELLOW)
        author_title = TextMobject(
                "by Le Chen\\\\"
                "le.chen@emory.edu"
                )
        author_title.set_color(GRAY)
        VGroup(session_title, author_title).arrange(DOWN)
        transform_title.to_corner(UP + LEFT)
        self.play(
            Transform(title, transform_title),
            LaggedStart(*map(FadeOutAndShiftDown, latex)),
            FadeInFrom(author_title, DOWN),
            FadeInFrom(session_title,UP),
        )
        self.wait()
