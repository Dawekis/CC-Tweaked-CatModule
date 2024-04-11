multishell.setTitle(multishell.getCurrent(), "All Equipment List")
paintutils.drawFilledBox(1,1,50,18,colors.lightBlue)
paintutils.drawBox(1,1,50,18,colors.black)
paintutils.drawPixel(50,1,colors.red)
term.setCursorPos(1,1);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
print(" All Equipment List")
local equip_name = peripheral.getNames()
local equip_name_num = #equip_name
local app_load = 1
table.sort(equip_name)
term.setTextColor(colors.black)
term.setBackgroundColor(colors.lightBlue)
while app_load == 1 do
    for i = 1,equip_name_num,1 do
        term.setCursorPos(3,i+2)
        print(equip_name[i])
        sleep(0.1)
    end
    local event,click, click_x, click_y = os.pullEvent("mouse_click")
    if  click_x == 50 and click_y == 1 and click == 1
    then
        app_load = 0
    end
end
paintutils.drawLine(50,1,51,1,colors.black)