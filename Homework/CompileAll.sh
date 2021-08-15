#!/usr/bin/env bash
# #!/bin/bash
if [ $# -eq 0 ]
then
   echo ""
   echo ""
   echo "Usage: $0 "
   echo "Work under working directory."
   echo "by Le CHEN, (chenle02@gmail.com)"
   echo "Sun 15 Aug 2021 07:29:57 PM EDT"
   echo ""
   echo ""
   exit 1
fi

for (( i = 1; i < 13; i++ )); do
   echo $i
   ./Prob.sh $i
done
