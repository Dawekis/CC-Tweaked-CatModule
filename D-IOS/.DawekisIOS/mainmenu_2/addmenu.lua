--程序模板
local add_menu = 1
while  add_menu == 1 do
    --构建程序界面
    multishell.setTitle(multishell.getCurrent(), "Add menu")
    paintutils.drawFilledBox(1,1,50,18,colors.lightBlue)
    paintutils.drawBox(1,1,50,18,colors.black)
    paintutils.drawPixel(50,1,colors.red)
    paintutils.drawLine(2,2,49,2,colors.white)
    term.setCursorPos(2,1);term.setTextColor(colors.orange);term.setBackgroundColor(colors.black)
    print("Add menu")
    term.setCursorPos(2,2);term.setTextColor(colors.black);term.setBackgroundColor(colors.white)
    print("Old menu list")
    term.setCursorPos(24,2);print("|Delete Menu|Add New Menu|")
    local menu_list = fs.list(".DawekisIOS/mainmenu")
    local menu_num = #menu_list
    local j = 1
    local a = 0
    --打印已有菜单名
    for i = 1,menu_num,1 do
        a = a + 1
        sleep(0.1)
        term.setCursorPos(3,j+3);term.setTextColor(colors.black);term.setBackgroundColor(colors.lightBlue)
        print("Main Menu - <"..tostring(i)..">")
        local m,n = math.modf(j/12)
        if n == 0
        then
            paintutils.drawLine(2,17,49,17,colors.white)
            paintutils.drawLine(22,17,29,17,colors.lightGray)
            paintutils.drawLine(23,17,28,17,colors.gray)
            paintutils.drawLine(25,17,26,17,colors.black)
            event,click, click_x, click_y = os.pullEvent("mouse_click")
            if click_x >= 30 and click_y == 17 and click == 1
            then
                paintutils.drawFilledBox(2,3,49,16,colors.lightBlue)
            else
                break
            end
            j = 0
        end
        j = j + 1
        if a == #menu_list
        then
            term.setCursorPos(3,j+3);term.setTextColor(colors.black);term.setBackgroundColor(colors.lightBlue)
            print("Total menu number:",#menu_list)
        end
    end
    event,click, click_x, click_y = os.pullEvent("mouse_click")
    if click_x == 50 and click_y == 1 and click == 1
    then
        add_menu = 0
    end
    --新建菜单
    if click_x <=48 and click_x >= 37 and click_y == 2 and click == 1
    then
        paintutils.drawBox(18,8,32,12,colors.black)
        term.setCursorPos(19,8);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Are you New?")
        term.setCursorPos(21,10);term.setTextColor(colors.green);term.setBackgroundColor(colors.black)
        print("Yes")
        term.setCursorPos(28,10);term.setTextColor(colors.red);term.setBackgroundColor(colors.black)
        print("No")
        event,click, click_x, click_y = os.pullEvent("mouse_click")
        --确定新建
        if click_x >= 21 and click_x <= 23 and click_y == 10 and click == 1
        then
            local new_menu_name = ".DawekisIOS/mainmenu/mainmenu_"..tostring(menu_num+1)..".lua"
            local new_menu_lua = io.open(new_menu_name,"w")
            new_menu_lua:read("a")
            local stop_line = "--go new menu"
            --写入新菜单代码
            for i in io.lines(".DawekisIOS/mainmenu/mainmenu_1.lua") do
                new_menu_lua:write(i.."\n")
                if i == "--menu name"
                then
                    new_menu_lua:write("    term.setCursorPos(1,1);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)".."\n")
                    new_menu_lua:write('    print("MainMenu - <'..tostring(menu_num+1)..'>")'..'\n')
                end
                if i == stop_line
                then
                    new_menu_lua:write("    if  click_x >= 30 and click_y == 17 and click == 1".."\n")
                    new_menu_lua:write("    then".."\n")
                    new_menu_lua:write('        shell.run("'..".DawekisIOS/mainmenu/mainmenu_"..tostring(menu_num+2)..'")'.."\n")
                    new_menu_lua:write("    end".."\n")
                end
            end
            new_menu_lua:close()
        end
    end
    --删除菜单
    if click_x <=35 and click_x >= 25 and click_y == 2 and click == 1
    then
        paintutils.drawBox(18,8,32,12,colors.black)
        term.setCursorPos(19,8);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Are you Del?")
        term.setCursorPos(21,10);term.setTextColor(colors.green);term.setBackgroundColor(colors.black)
        print("Yes")
        term.setCursorPos(28,10);term.setTextColor(colors.red);term.setBackgroundColor(colors.black)
        print("No")
        event,click, click_x, click_y = os.pullEvent("mouse_click")
        if click_x >= 21 and click_x <= 23 and click_y == 10 and click == 1 and menu_num >= 4
        then
            shell.run("delete .DawekisIOS/mainmenu/mainmenu_"..tostring(menu_num)..".lua")
        end
    end
end
paintutils.drawPixel(50,1,colors.black)