multishell.setTitle(multishell.getCurrent(), "DawekisIOS")
local menu_load = 1
local menu_image = paintutils.loadImage(".DawekisIOS/mainmenu_2/mainmenu_2.nfp")
while menu_load == 1 do
    paintutils.drawImage(menu_image,1,1)
    --菜单名
    term.setCursorPos(1,1);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
    print("MainMenu - <2>")
    --命名网聊
    term.setCursorPos(4,8);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
    print("IChat")
    --监听鼠标
    local event,click, click_x, click_y = os.pullEvent("mouse_click")
    --转变：返回菜单1
    if  click_x <= 21 and click_y == 17 and click == 1
    then
        menu_load = 0
    end
    --应用：安装程序
    if  click_x >= 14 and click_x <= 24 and click_y >= 9 and click_y <= 16 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu_1/games")
    end
    --应用：添加更多菜单
    if  click_x >= 40 and click_x <= 50 and click_y >= 9 and click_y <= 16 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu_1/games")
    end
end