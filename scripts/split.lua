#!/usr/bin/env lua
-- By Le Chen @ Emory
-- 06/2020
require("csv")
table = dataToTable('pages.csv',',')
offset=22
bookfile="../Nicholson-OpenLAWA-2019A.pdf"

for i=1,#table,1 do
	for j=1,3,1 do
		table[i][j] = string.gsub(table[i][j],"%s+","")
	end
	table[i][4] = string.gsub(table[i][4],"^%s*(.-)%s*$","%1")
end
loadfile("/home/lechen/lua/saveTable.lua")(table,"SavedTable.table")

-- Split pdf flie
for i=1,#table,1 do
	-- print(i)
	-- print("pdftk ../Nicholson-OpenLAWA-2019A.pdf cat " .. table[i][2]+offset .. "-" ..table[i][3]+offset .. " output " .. table[i][1]..".pdf" )
	if tonumber(table[i][1]) == nil then
		cmd = string.format("pdftk %s cat %1.0f-%1.0f output Section_%s.pdf",
			bookfile,
			table[i][2]+offset,
			table[i][3]+offset,
			table[i][1]
			)
	else
		cmd = string.format("pdftk %s cat %1.0f-%1.0f output Chapter_%s.pdf",
			bookfile,
			table[i][2]+offset,
			table[i][3]+offset,
			table[i][1]
			)
	end
	-- print(cmd)
	-- os.execute(cmd)
end

-- Generate the vimwiki table
for i=1,#table,1 do
	if tonumber(table[i][1]) == nil then
		cmd = string.format("|Section %s. %s | [[local:../vimwiki_html/Section_%s.pdf|text]] | [[local:../vimwiki_html/Slides_%s-Presentation.pdf|presentation]] | [[local:../vimwiki_html/Slides_%s-Handout.pdf|handout]]|",
			table[i][1], table[i][4],
			table[i][1],
			table[i][1],
			table[i][1]
			)
	else
		cmd = string.format("|*Chapter %s. %s* | [[local:../vimwiki_html/Chapter_%s.pdf|text]] |  |  |",
			table[i][1], table[i][4],
			table[i][1]
			)
	end
	print(cmd)
	-- os.execute(cmd)
end
