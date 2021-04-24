#!/usr/bin/env bash
# #!/bin/bash
if [ $# -eq 0 ]
then
   echo ""
   echo ""
   echo "Usage: $0 [Yes]"
   echo "Work under working directory."
   echo "When the second dummy variable is given, it will compile all chapters."
   echo "by Le CHEN, (chenle02@gmail.com)"
   echo "Mon 21 Dec 2020 07:19:04 PM EST"
   echo ""
   echo ""
   exit 1
fi


for i in 6 7 8 9
do
  echo "Chapter ... Number $i"
  ./CompileChapter.sh $i
done
