multishell.setTitle(multishell.getCurrent(), "DawekisIOS")
local menu_load = 1
local menu_image = paintutils.loadImage(".DawekisIOS/mainmenu_0.nfp")
while menu_load == 1 do
    paintutils.drawImage(menu_image,1,1)
    --菜单名
    term.setCursorPos(1,1);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
    print("MainMenu - <3>")
    --监听鼠标
    local event,click, click_x, click_y = os.pullEvent("mouse_click")
    --转变：菜单2
    if  click_x <= 21 and click_y == 17 and click == 1
    then
        menu_load = 0
    end
    --转变：菜单4
    if  click_x >= 30 and click_y == 17 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu/mainmenu_4")
    end
end
