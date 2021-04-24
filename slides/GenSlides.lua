#!/usr/bin/env lua
if #arg == 0  then
    print(arg[0] .. " [Yes]")
    print([[

    Make sure first edit TOC.lua and run it to generate TOC.table.

        By Le Chen;
        chenle02@gmail.com
        2021-04-24 Sat 09:26:57
    ]])
    return
end

TOC = dofile("TOC.table")

print("There are " .. #TOC .. " Chapters")

-- First update Common.tex file
os.execute("cp .Common.tex Common.tex")
os.execute("sed -i 's/#University/" .. TOC[0]['University'] .. "/g' Common.tex")
os.execute("sed -i 's/#City/" .. TOC[0]['City'] .. "/g' Common.tex")
os.execute("sed -i 's/#Year_Season/" .. TOC[0]['Year_Season'] .. "/g' Common.tex")
os.execute("sed -i 's/#Email/" .. TOC[0]['Email'] .. "/g' Common.tex")
os.execute("sed -i 's/#Author/" .. TOC[0]['Author'] .. "/g' Common.tex")
os.execute("sed -i 's/#Course_Name/" .. TOC[0]['Course_Name'] .. "/g' Common.tex")

-- Now generate all chapter-#.tex
for i=1,#TOC do
    Chapter_Number = i+5
    Chapter_File = "Chapter-" .. Chapter_Number .. ".tex"
    os.execute("cp Chapter-#.tex ".. Chapter_File)
    os.execute("sed -i 's/#Chapter/" .. TOC[i]['Chapter'] .. "/g' " .. Chapter_File)
    for s=1,#TOC[i]['Section'] do
        print("There are " .. #TOC[i]['Section'] .. " Sections.")
        Section_Name = "Section_"..Chapter_Number .. "-" .. s
        Section_File = Section_Name .. ".tex"
        os.execute("echo '\\\\include{" .. Section_Name .. "}' >> " .. Chapter_File)
        os.execute("echo '\\\\mySection{" .. TOC[i]['Section'][s] .. "}' >" .. Section_File)
    end
    os.execute("echo '\\\\end{document}' >> " .. Chapter_File)
end
