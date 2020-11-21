#!/usr/bin/env lua
if #arg == 0  then
    print(arg[0] .. " main_video_file_no_extension content.txt")
    return
end
video_file = arg[1]
content_file = arg[2]
print(video_file)
print(contnet_file)


-- video_file="0820"
-- content_file = "0820_content.txt"

-- http://lua-users.org/wiki/FileInputOutput
-- see if the file exists
function file_exists(file)
  local f = io.open(file, "r")
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
function split(s, sep)
    local fields = {}
    local sep = sep or " "
    local pattern = string.format("([^%s]+)", sep)
    string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
    return fields
end

-- tests the functions above
-- file = '/home/lechen/Dropbox/Teaching/svn_teaching/2020_Fall_Math221/videos/my_records/08-20/content.txt'

lines = lines_from(content_file)

-- print all line numbers and their contents
for k,v in pairs(lines) do
  print('line[' .. k .. ']', v)
  a = split(v,',')
  time = split(a[1],'--')
  a[2] = a[2]:gsub("%s+$","")
  title = a[2]
  -- title = a[2]
  print("Start from " .. time[1] .. " ends on " .. time[2])
  newfile = string.gsub(video_file .."-".. k .. title .. ".mp4","%s","\\ ")
  cmd = "ffmpeg -i " .. video_file .. ".mp4" .. " -ss " .. time[1] .. " -to " .. time[2] .. " " .. newfile
  print(cmd)
  if arg[3] ~= nil then
      os.execute(cmd)
  end

  if a[3] ~=nil then
      a[3] = a[3]:gsub("%s+","")
      if not file_exists(a[3]..".mp4") then
	  print("File " .. a[3]..".mp4 does not exits. Generate it now...")
	  if not file_exists(a[3]..".txt") then
	      print("File " .. a[3]..".txt does not exits. Specify this file first.")
	  else
	      cmd = "./GenTitleVideo.sh " .. a[3]
	      print(cmd)
	      if arg[3] ~= nil then
		  os.execute(cmd)
	      end
	  end
      else
	  cmd = "MP4Box -cat " .. a[3] ..".mp4 -cat " .. newfile .. " -new " .. newfile
	  print(cmd)
	  if arg[3] ~= nil then
	      os.execute(cmd)
	  end
      end
   end
end

