multishell.setTitle(multishell.getCurrent(), "DawekisIOS")
local menu_load = 1
local menu_image = paintutils.loadImage(".DawekisIOS/mainmenu_0.nfp")
while menu_load == 1 do
    paintutils.drawImage(menu_image,1,1)
--menu name
    local event,click, click_x, click_y = os.pullEvent("mouse_click")
--go old menu
    if  click_x <= 21 and click_y == 17 and click == 1
    then
        menu_load = 0
    end
--go new menu
end
