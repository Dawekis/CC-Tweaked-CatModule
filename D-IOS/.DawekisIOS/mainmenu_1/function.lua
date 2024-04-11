--程序模板
multishell.setTitle(multishell.getCurrent(), "Function")
paintutils.drawFilledBox(1,1,50,18,colors.lightBlue)
paintutils.drawBox(1,1,50,18,colors.black)
paintutils.drawPixel(50,1,colors.red)
term.setCursorPos(1,1);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
print(" Function")
local app_load = 1
while app_load == 1 do
    local event,click, click_x, click_y = os.pullEvent("mouse_click")
    if  click_x == 50 and click_y == 1 and click == 1
    then
        app_load = 0
    end
end