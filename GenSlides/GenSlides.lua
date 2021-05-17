#!/usr/bin/env lua
if #arg == 0  then
    print(arg[0] .. " [Yes]")
    print([[

    Make sure first edit TOC.lua and run it to generate TOC.table.

        By Le Chen;
        chenle02@gmail.com
        Sat 15 May 2021 08:43:09 PM EDT
    ]])
    return
 end


toc = dofile("toc.table")

for i=1,#toc do
  ConfFile = 'Chapter-' .. toc[i]['Number'] .. '.conf'
  file = io.open(ConfFile,'w')
  file:write('\\newcommand{\\myChapter}{Chapter ' .. toc[i]['Number'] .. '. ' .. toc[i]['Name'] .. '}\n')
  file:write('\\newcommand{\\mySection}[1]{\\section{\\S\\: #1}\\begin{frame}{\\myChapter}\\tableofcontents[currentsection]\\end{frame}}\n')
  file:write("\\begin{frame}\n")
  file:write("\\begin{center}\n")
  file:write("\\huge\n")
  file:write("\\myChapter\n")
  file:write("\\end{center}\n")
  file:write("\\end{frame}\n")
  for j=1,#toc[i]['Sections'] do
      Section = 'Section_' .. toc[i]['Number'] .. '-' .. j
      SectionFile = Section .. '.tex'
      fileSec = io.open(SectionFile,'w')
      file:write("\\input{".. Section .. '}\n')
      fileSec:write('\\mySection{' .. toc[i]['Number'] .. '.' .. j .. ' ' .. toc[i]['Sections'][j] .. '}')
      fileSec:close()
  end
  file:write("\\end{document}")
end
file:close()

