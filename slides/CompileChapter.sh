#!/usr/bin/env bash
# #!/bin/bash
if [ $# -eq 0 ]
then
   echo ""
   echo ""
   echo "Usage: $0.sh Number_of_Chapter"
   echo "Work under working directory."
   echo "by Le CHEN, (chenle02@gmail.com)"
   echo "Mon 21 Dec 2020 04:43:09 PM EST"
   echo ""
   echo ""
   exit 1
fi

SourceFile="Chapter-"$1".tex"
cp $SourceFile tmp.tex
sed -i -e '/include/!d' -e 's/\include/\\\includeonly/' tmp.tex
# The tmp.tex takes the following form now:
# \\includeonly{Section_5-1}
# \\includeonly{Section_5-2}
# \\includeonly{Section_5-3}
# \\includeonly{Section_5-4}
# \\includeonly{Section_5-5}
# \\includeonly{Section_5-6}
# \\includeonly{Section_5-7}
# \\includeonly{Section_5-8}

# Remove the first line of the sourefile and save to the above files.
# The first line is
# \documentclass[compress,trans,9pt]{beamer}
ChapterFull="Chapter-"$1"_full.tex"
ChapterComp="Chapter-"$1"_compact.tex"
# echo "$ChapterComp"
# echo "$ChapterComp"
# File names are:
# Chapter_5-1_full.tex
# Chapter_5-1_comp.tex
sed '1d' $SourceFile > $ChapterFull
cp $ChapterFull $ChapterComp
sed -i '1 i \\\documentclass[9pt]{beamer}' $ChapterFull
sed -i '1 i \\\documentclass[compress,trans,9pt]{beamer}' $ChapterComp
lualatex --batchmode $ChapterComp
lualatex --batchmode $ChapterComp
lualatex --batchmode $ChapterFull
lualatex --batchmode $ChapterFull
# Save the pdfs for the chapters.
mv "Chapter-"$1"_full.pdf" f.pdf
mv "Chapter-"$1"_compact.pdf" c.pdf

sed -i '3 i \\\includeonly{TOINCLUDE}' $ChapterFull
sed -i '3 i \\\includeonly{TOINCLUDE}' $ChapterComp

# Now loop over all lines in the tmp.tex
while read p; do
	Section=$(echo "$p" | cut -f 2 -d '{')
	Section=$(echo "$Section" | cut -f 1 -d '}')
	SectionFull=$Section"_full.pdf"
	SectionComp=$Section"_compact.pdf"
  # echo "$SectionFull"
  # echo "$SectionComp"
	# File names are:
	# Chapter_5-1_full.pdf
	# Chapter_5-1_comp.pdf

	sed -i "3s/TOINCLUDE/$Section/" $ChapterComp
	sed -i "3s/TOINCLUDE/$Section/" $ChapterFull
	# cp $ChapterFull $Section"_full.tex"
	# cp $ChapterComp $Section"_comp.tex"
	lualatex --batchmode $ChapterFull
	lualatex --batchmode $ChapterFull
	lualatex --batchmode $ChapterComp
	lualatex --batchmode $ChapterComp

	mv "Chapter-"$1"_full.pdf" $SectionFull
	mv "Chapter-"$1"_compact.pdf" $SectionComp
	sed -i "3s/$Section/TOINCLUDE/" $ChapterComp
	sed -i "3s/$Section/TOINCLUDE/" $ChapterFull
done < tmp.tex

# # Remove the third line for includeonly:
sed -i '3d' $ChapterFull
sed -i '3d' $ChapterComp
# # Restore the pdfs for the chapters.
mv f.pdf "Chapter-"$1"_full.pdf"
mv c.pdf "Chapter-"$1"_compact.pdf"

