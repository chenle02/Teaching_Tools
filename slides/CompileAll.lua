#!/usr/bin/env lua
if #arg == 0  then
    print(arg[0] .. " [Yes]")
    print([[

    Make sure first edit TOC.lua for all the meta data.

        By Le Chen;
        chenle02@gmail.com
        Sat 24 Apr 2021 11:32:07 AM EDT
    ]])
    return
 end

dofile("TOC.lua")
TOC = dofile("TOC.table")

for i=1,#TOC do
  print("Compile Chapter " .. TOC[i]['ChapterNum'])
  os.execute("./CompileChapter.sh " .. TOC[i]['ChapterNum'] )
end
