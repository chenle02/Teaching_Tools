#!/usr/bin/env sh
# $1 should be the section file without extension

cp $1.txt .Section.txt
python3 -m manim math221.py Section_X
cp ./media/videos/math221/1440p60/Section_X.mp4 $1.mp4
