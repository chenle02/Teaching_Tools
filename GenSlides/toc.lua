#!/usr/bin/env lua

local all={}
local d={}
local i=0

i=i+1
all[i] = {}
all[i]['Number']= 1
all[i]['Name'] = 'Topics in calculus'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Various continuities'
all[i]['Sections'][2] = 'Techniques for integrations'
all[i]['Sections'][3] = 'Taylor expansions'

i=i+1
all[i] = {}
all[i]['Number']= 2
all[i]['Name'] = 'Topics in real analysis'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Liminf and limsup'
all[i]['Sections'][2] = 'Lebesgue integral and basic properties'
all[i]['Sections'][3] = 'Various convergences'

i=i+1
all[i] = {}
all[i]['Number']= 3
all[i]['Name'] = 'Topics in linear algebra'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Vector spaces'
all[i]['Sections'][2] = 'Various matrix decompositions'

loadfile("./saveTable.lua")(all,"toc.table")
