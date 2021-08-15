#!/usr/bin/env sh

#!/usr/bin/env bash
# #!/bin/bash
if [ $# -eq 0 ]
then
   echo ""
   echo ""
   echo "Usage: $0.sh week"
   echo "Work under working directory."
   echo "Week is an integer from 1 to 14"
   echo "by Le CHEN, (chenle02@gmail.com)"
   echo "Wed 02 Sep 2020 09:47:22 AM EDT"
   echo ""
   echo ""
   exit 1
fi
lualatex ./SolX_Template.tex $1
mv ./SolX_Template.pdf ./Problems_HW_$1.pdf
rm SolX_Template.aux \
   SolX_Template.log
