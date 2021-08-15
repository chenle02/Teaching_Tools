-- This is my utility functions
-- By Le Chen, 2020, Aug. 23.


-- http://lua-users.org/wiki/FileInputOutput
-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

-- split("a,b,c", ",") => {"a", "b", "c"}
--https://stackoverflow.com/questions/40149617/split-string-with-specified-delimiter-in-lua
function split(s, sep)
    local fields = {}
    local sep = sep or " "
    local pattern = string.format("([^%s]+)", sep)
    string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
    return fields
end

-- copy a file content to current file
-- https://tex.stackexchange.com/questions/97822/how-to-read-a-file-with-luatex
-- Usage:
-- \begin{document}
--   \directlua{readtxt("myBank/10-2-7.tex")}
-- \end{document}
function readtxt(filename)
   file = io.open(filename, "r")
   for line in file:lines() do
     print(line)
     tex.print(line)
   end
end

-- The first function:
function table2wiki(table,wiki_file)
   local Homework = table
   -- https://www.tutorialspoint.com/lua/lua_file_io.htm
   local file = io.open(wiki_file,"w")
   for hw=1,#Homework do
      file:write("== HW ".. hw .. " ==".."\n")
      file:write("*  Points:".. Homework[hw]["Points"] .."\n")
      file:write("*  Deadline:".. Homework[hw]["Deadline"] .."\n")
      file:write("*  Questions:".."\n")
      for q=1,#Homework[hw]["Questions"] do
          file:write("\t".. q .. " " .. ":" .. Homework[hw]["Questions"][q]["Points"] .. " points: " .. Homework[hw]["Questions"][q]["Content"] .. "\n" )
      end
   end
   io.close(file)
end

-- The second function
function wiki2table(wiki_file)
   -- file = "./Homework_Math211_2021Spring.wiki"
   local file = wiki_file
   -- Read all lines in to a list
   lines= lines_from(file)
   -- loadfile("/home/lechen/lua/saveTable.lua")(lines,"SavedTable.table")

   local Homework={}
   local hw = 0
   local questionmode=false
   local homeworkmode=true
   local blockmode=false
   local myNLChar = [[]]
   for k,v in pairs(lines) do
      if v:match("HW") then
	  hw = hw +1
	  Homework[hw]={}
	  questionmode = false
	  homeworkmode = true
	  blockmode = false
      elseif v:match("*  Points:") and homeworkmode and not questionmode and not blockmode then
          Homework[hw]["Points"] = tonumber(v:gsub("*  Points:",""),10)
      elseif v:match("*  Deadline:") and homeworkmode and not questionmode and not blockmode then
          Homework[hw]["Deadline"] = v:gsub("*  Deadline:","")
      elseif v:match("Questions:") and homeworkmode and not questionmode and not blockmode then
          questionmode = true
          homeworkmode = false
          blockmode = false
          Homework[hw]["Questions"] = {}
      elseif v:match("{{{") and not homeworkmode and questionmode and not blockmode then
          blockmode = true
      elseif v:match("}}}") and not homeworkmode and questionmode and blockmode then
          blockmode = false
      elseif not homeworkmode and questionmode and not blockmode then
          -- print("Questions mode now")
          a = split(v,":")
          q = tonumber(a[1],10)
          -- print(q)
          Homework[hw]["Questions"][q]={}
          Homework[hw]["Questions"][q]["Points"] = tonumber(a[2]:gsub("points",""),10)
          Homework[hw]["Questions"][q]["Content"] = string.gsub(a[3],"^%s+","")
      elseif blockmode then
          Homework[hw]["Questions"][q]["Content"] =  Homework[hw]["Questions"][q]["Content"] .. myNLChar .. v
      end
   end
   -- Debug only
   -- loadfile("/home/lechen/lua/saveTable.lua")(Homework,"TestHW.table")


   -- Computing the total points for each HW
   for hw=1,#Homework do
       Homework[hw]['Points'] = 0
       for i=1, #Homework[hw]["Questions"] do
           Homework[hw]['Points'] = Homework[hw]['Points'] + Homework[hw]["Questions"][i]['Points']
       end
   end

   return Homework
end

-- Debug only
-- a = wiki2table("homework.wiki")
-- loadfile("saveTable.lua")(a,"a.table")


