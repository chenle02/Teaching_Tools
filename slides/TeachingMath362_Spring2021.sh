#!/usr/bin/env bash
# #!/bin/bash
Chapter="5"
Path="~/Dropbox/Teaching/svn_teaching/2021_Spring_Math362/slides/"
File=${Path}"Chapter-"${Chapter}"_full.pdf"
echo $File &
zathura $File &

