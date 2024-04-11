name = peripheral.getNames()
table.sort(name)
monitor = name[#name]
local screen = peripheral.wrap("monitor_6")
screen.setTextScale(1)
peripheral.getNames()
local size_x,size_y = screen.getSize()
local c_x = size_x/50
local c_y = size_y/18
local c = math.min(c_x,c_y)
screen.setTextScale(c)
shell.run("monitor monitor_6 DawekisIOS")
