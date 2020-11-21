#!/usr/bin/env lua
-- by Le Chen @ Emory
-- 06/2020
--
if arg[1] == nil then
	print("Usage: cmd 0/1")
	print("    0: vimwiki_working version")
	print("    1: public version")
	return
end

require("csv")
table = dataToTable('pages.csv',',')

for i=1,#table,1 do
	for j=1,3,1 do
		table[i][j] = string.gsub(table[i][j],"%s+","")
	end
	table[i][4] = string.gsub(table[i][4],"^%s*(.-)%s*$","%1")
end
loadfile("saveTable.lua")(table,"SavedTable.table")

-- Generate the vimwiki table
if tonumber(arg[1])== 0 then
	location = "file:~/Dropbox/Teaching/svn_teaching/2020_Fall_Math221"
	for i=1,#table,1 do
		if tonumber(table[i][1]) == nil then
			cmd = string.format("|Section %s. %s",table[i][1],table[i][4])
			cmd = cmd .. string.format("| [[%s/vimwiki_html/Section_%s.pdf|text]] ", location, table[i][1])
			cmd = cmd .. string.format("| [[%s/vimwiki_html/Slides_%s-Presentation.pdf|presentation]] ", location, table[i][1])
			cmd = cmd .. string.format("| [[%s/vimwiki_html/Slides_%s-Handout.pdf|handout]] ", location, table[i][1])
			cmd = cmd .. string.format("| [[%s/Booksections/Sol_Section_%s.pdf|Sol]] ", location, table[i][1])
			cmd = cmd .. "| "
			cmd = cmd .. "| "
		else
			cmd = string.format("|*Chapter %s. %s*",table[i][1],table[i][4])
			cmd = cmd .. string.format("| [[%s/vimwiki_html/Chapter_%s.pdf|text]] ", location, table[i][1])
			cmd = cmd .. "| "
			cmd = cmd .. "| "
			cmd = cmd .. string.format("| [[%s/Booksections/Sol_Chapter_%s.pdf|Sol]] ", location, table[i][1])
			cmd = cmd .. string.format("| [[%s/samples/Question-bank/Chapter_%s.pdf|bank]] ", location, table[i][1])
			cmd = cmd .."|"
		end
		print(cmd)
	end
elseif tonumber(arg[1])== 1 then
	location = "local:.."
	for i=1,#table,1 do
		if tonumber(table[i][1]) == nil then
			cmd = string.format("|Section %s. %s",table[i][1],table[i][4])
			cmd = cmd .. string.format("| [[%s/vimwiki_html/Section_%s.pdf|text]] ", location, table[i][1])
			cmd = cmd .. string.format("| [[%s/vimwiki_html/Slides_%s-Presentation.pdf|presentation]] ", location, table[i][1])
			cmd = cmd .. string.format("| [[%s/vimwiki_html/Slides_%s-Handout.pdf|handout]] ", location, table[i][1])
			-- cmd = cmd .. string.format("| [[%s/Booksections/Sol_Section_%s.pdf|Sol]] ", location, table[i][1])
			-- cmd = cmd .. "| "
			cmd = cmd .. "| "
		else
			cmd = string.format("|*Chapter %s. %s*",table[i][1],table[i][4])
			cmd = cmd .. string.format("| [[%s/vimwiki_html/Chapter_%s.pdf|text]] ", location, table[i][1])
			cmd = cmd .. "| "
			cmd = cmd .. "| "
			-- cmd = cmd .. string.format("| [[%s/Booksections/Sol_Chapter_%s.pdf|Sol]] ", location, table[i][1])
			-- cmd = cmd .. string.format("| [[%s/samples/Question-bank/Chapter_%s.pdf|bank]] ", location, table[i][1])
			cmd = cmd .."|"
		end
		print(cmd)
	end
else
	print("Input an argument either 0 or 1.")
end
