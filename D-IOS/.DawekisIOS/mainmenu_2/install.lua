--程序模板
local intall_load = 1
while intall_load == 1 do
    multishell.setTitle(multishell.getCurrent(), "Install")
    paintutils.drawFilledBox(1,1,50,18,colors.lightBlue)
    paintutils.drawBox(1,1,50,18,colors.black)
    paintutils.drawPixel(50,1,colors.red)
    paintutils.drawLine(2,3,47,3,colors.white)
    term.setCursorPos(2,4);term.setTextColor(colors.black);term.setBackgroundColor(colors.lightBlue)
    print("Please use Chat Box to input.")
    term.setCursorPos(48,3);term.setTextColor(colors.green);term.setBackgroundColor(colors.black)
    print("OK")
    term.setCursorPos(2,1);term.setTextColor(colors.orange);term.setBackgroundColor(colors.black)
    print("Install")
    term.setCursorPos(2,2);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
    print("Click white line to input install lua.")
    local event,click, click_x, click_y = os.pullEvent("mouse_click")
    --进入命名
    if  click_x <= 47 and click_y == 3 and click == 1
    then
        local name_load = 1
        while name_load == 1 do
            local event, username, message, uuid, isHidden = os.pullEvent("chat")
            term.setCursorPos(3,3);term.setTextColor(colors.black);term.setBackgroundColor(colors.white)
            print(message)
            local event,click, click_x, click_y = os.pullEvent("mouse_click")
            --确定命名
            if  click_x == 48 or click_x == 49 and click_y == 3 and click == 1
            then
                local lua_name = message
                paintutils.drawFilledBox(4,5,48,16,colors.lightBlue)
                paintutils.drawBox(4,5,48,16,colors.black)
                paintutils.drawPixel(48,5,colors.red)
                term.setCursorPos(46,6);term.setTextColor(colors.green);term.setBackgroundColor(colors.black)
                print("OK")
                term.setCursorPos(5,5);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
                print("Please input you want to install path")
                local path_load = 1
                --输入安装目录
                while path_load == 1 do
                    paintutils.drawLine(5,6,45,6,colors.white)
                    local event,click, click_x, click_y = os.pullEvent("mouse_click")
                    if click_x >= 6 and click_x <= 45 and click_y == 6 and click == 1
                    then
                        local event, username, message, uuid, isHidden = os.pullEvent("chat")
                        term.setCursorPos(6,6);term.setTextColor(colors.black);term.setBackgroundColor(colors.white)
                        print(message)
                        local event,click, click_x, click_y = os.pullEvent("mouse_click")
                        --确定安装目录&开始安装
                        if click_x == 46 or click_x == 47 and click_y == 6 and click == 1
                        then
                            local intall_path = message
                        end
                        --返回选择安装lua
                        if click_x == 48 and click_y == 5 and click == 1
                        then
                            paintutils.drawFilledBox(4,5,48,16,colors.lightBlue)
                            path_load = 0
                        end
                    end
                    --返回选择安装lua
                    if click_x == 48 and click_y == 5 and click == 1
                    then
                        paintutils.drawFilledBox(4,5,48,16,colors.lightBlue)
                        path_load = 0
                    end
                end
            end
            --退出程序
            if  click_x == 50 and click_y == 1 and click == 1
            then
                intall_load = 0
                name_load = 0
            end
            paintutils.drawLine(2,3,47,3,colors.white)
        end
    end
    --退出程序
    if click_x == 50 and click_y == 1
    then
        intall_load = 0
    end
end
paintutils.drawPixel(50,1,colors.black)