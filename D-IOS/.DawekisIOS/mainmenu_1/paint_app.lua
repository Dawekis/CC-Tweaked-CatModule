--程序模板
local print_load = 1
while  print_load == 1 do
multishell.setTitle(multishell.getCurrent(), "Paint")
paintutils.drawFilledBox(1,1,50,18,colors.lightBlue)
paintutils.drawBox(1,1,50,18,colors.black)
paintutils.drawPixel(50,1,colors.red)
paintutils.drawLine(2,2,49,2,colors.white)
term.setCursorPos(2,1);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
print("Paint")
term.setCursorPos(2,2);term.setTextColor(colors.black);term.setBackgroundColor(colors.white)
print("|New|Scan|Del|")
local app_load = 1
while app_load == 1 do
    local print_list = fs.list("Paint")
    local print_list_num = #print_list
    local j = 1
    local a = 1
    local scan_open = 1
    term.setCursorPos(3,3);term.setTextColor(colors.black);term.setBackgroundColor(colors.lightBlue)
    local event,click, click_x, click_y = os.pullEvent("mouse_click")
    if click_x >= 7 and click_x <= 11 and click_y == 2 and click == 1
    then
        while scan_open == 1 do
            if print_list_num == 0
            then
                break
            end
            term.setCursorPos(2,2);term.setTextColor(colors.black);term.setBackgroundColor(colors.white)
            print("|New|Open|")
            local h = 0
            for i = 1,print_list_num,1 do
                sleep(0.1)
                term.setCursorPos(3,2+j);term.setTextColor(colors.black);term.setBackgroundColor(colors.lightBlue)
                print(print_list[i])
                j = j+1
                local m,n = math.modf(i/15)
                if n == 0
                then
                    paintutils.drawLine(2,17,49,17,colors.white)
                    paintutils.drawLine(22,17,29,17,colors.lightGray)
                    paintutils.drawLine(23,17,28,17,colors.gray)
                    paintutils.drawLine(25,17,26,17,colors.black)
                    local event,click, click_x, click_y = os.pullEvent("mouse_click")
                    if click_x >= 30 and click_y == 17 and click == 1
                    then
                        paintutils.drawFilledBox(2,3,49,16,colors.lightBlue)
                        j = 1
                    elseif click_x >= 2 and click_x <= 49 and click_y >= 3 and click_y <= 16 and click == 1
                    then
                        j = 1
                        paintutils.drawPixel(2,click_y,colors.green)
                        local b = 1
                        local y = click_y + (m-1)*15 - 2
                        while b == 1 do
                            local event,click, click_x, click_y = os.pullEvent("mouse_click")
                            if click_x >= 30 and click_y == 17 and click == 1
                            then
                                paintutils.drawFilledBox(2,3,49,16,colors.lightBlue)
                                b = 0
                            elseif click_x >= 2 and click_x <= 49 and click_y >= 3 and click_y <= 16 and click == 1
                            then
                                paintutils.drawLine(2,3,2,16,colors.lightBlue)
                                paintutils.drawPixel(2,click_y,colors.green)
                                y = click_y + (m-1)*15 - 2
                            elseif click_x >= 7 and click_x <= 11 and click_y == 2 and click == 1
                            then
                                shell.run("paint","Paint/"..print_list[y])
                                app_load = 0
                                scan_open = 0
                                b = 0
                                a = 0
                            elseif click_x >= 13 and click_x <= 16 and click == 1
                            then
                                shell.run("delete Paint/"..print_list[y])
                                b = 0
                                a = 0
                                paintutils.drawFilledBox(2,3,49,17,colors.lightBlue)
                                term.setCursorPos(2,2);term.setTextColor(colors.black);term.setBackgroundColor(colors.white)
                                print("|New|Scan|Del|")
                                click_x = 7
                                click_y = 2
                                break
                            elseif click_x ==50 and click_y == 1 and click == 1
                            then
                                print_load = 0
                                app_load = 0
                                scan_open = 0
                                a = 0
                                break
                            elseif click_x <= 5 and click_y == 2 and click == 1
                            then
                                scan_open = 0
                                a = 0
                                break
                            end
                        end
                        if a == 0
                        then
                            break
                        end
                    end
                elseif i == print_list_num
                then
                    local event,click, click_x, click_y = os.pullEvent("mouse_click")
                    if click_x >= 2 and click_x <= 49 and click_y >= 3 and click_y <= i - m*15 + 3 and click == 1
                    then
                        paintutils.drawPixel(2,click_y,colors.green)
                        local b = 1
                        local y = click_y + m*15 - 2
                        while b == 1 do
                            local event,click, click_x, click_y = os.pullEvent("mouse_click")
                            if click_x >= 2 and click_x <= 49 and click_y >= 3 and click_y <= i - m*15 + 3 and click == 1
                            then
                                paintutils.drawLine(2,3,2,16,colors.lightBlue)
                                paintutils.drawPixel(2,click_y,colors.green)
                                y = click_y + m*15 - 2
                            elseif click_x >= 13 and click_x <= 16 and click == 1
                            then
                                shell.run("delete Paint/"..print_list[y])
                                b = 0
                                a = 0
                                paintutils.drawFilledBox(2,3,49,17,colors.lightBlue)
                                term.setCursorPos(2,2);term.setTextColor(colors.black);term.setBackgroundColor(colors.white)
                                print("|New|Scan|Del|")
                                click_x = 7
                                click_y = 2
                            elseif click_x >= 7 and click_x <= 11 and click_y == 2 and click == 1
                            then
                                shell.run("paint","Paint/"..print_list[y])
                                app_load = 0
                                scan_open = 0
                                b = 0
                                a = 0
                            elseif click_x ==50 and click_y == 1 and click == 1
                            then
                                print_load = 0
                                app_load = 0
                                scan_open = 0
                                b = 0
                                a = 0
                            end
                        end
                        if a == 0
                        then
                            break
                        end
                    end
                    if a == 0
                        then
                            break
                        end
                elseif a == 0
                then
                    break
                end
            end
            scan_open = 0
        end
    end
    if  click_x == 50 and click_y == 1 and click == 1
    then
        app_load = 0
        print_load = 0
    end
    if click_x <= 5 and click_y == 2 and click == 1
    then
        paintutils.drawFilledBox(1,1,50,18,colors.lightBlue)
        paintutils.drawBox(1,1,50,18,colors.black)
        paintutils.drawPixel(50,1,colors.red)
        paintutils.drawLine(2,3,49,3,colors.white)
        paintutils.drawBox(3,5,48,16,colors.black)
        paintutils.drawFilledBox(4,6,47,15,colors.white)
        term.setCursorPos(2,2);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Please input new file name:")
        term.setCursorPos(2,1)
        print("New Paint Name")
        term.setCursorPos(23,5)
        print("Tips")
        term.setCursorPos(48,3);term.setTextColor(colors.green);term.setBackgroundColor(colors.black)
        print("OK")
        term.setCursorPos(5,8);term.setTextColor(colors.black);term.setBackgroundColor(colors.white)
        print("Please use Chat Box input Paint Name.")
        term.setCursorPos(5,9)
        print("Please use click white line of start.")
        local new_load = 1
        while new_load == 1 do
            local event,click, click_x, click_y = os.pullEvent("mouse_click")
            if click_x == 50 and click_y == 1 and click == 1
            then
                new_load = 0
                app_load = 0
            end
            if click_x <= 47 and click_y == 3 and click == 1
            then
                local name_load = 1
                while name_load == 1 do
                paintutils.drawLine(2,3,47,3,colors.white)
                term.setCursorPos(14,10);term.setTextColor(colors.black);term.setBackgroundColor(colors.white)
                print("Now,you can speak")
                term.setCursorPos(8,11)
                print("what you want to input paint name.")
                term.setCursorPos(8,12)
                print("Please lick Tips to delete text.")
                local event, username, message, uuid, isHidden = os.pullEvent("chat")
                term.setCursorPos(2,3)
                print(message)
                local event,click, click_x, click_y = os.pullEvent("mouse_click")
                if  click_x >= 48 and click_y == 3 and click == 1
                then
                    local loading_name = "paint Paint/"..message
                    shell.run(loading_name)
                    name_load = 0
                    new_load = 0
                    app_load = 0
                else
                    term.setCursorPos(8,11)
                    print("what you want to input paint name again.")
                end
                if  click_x ==50 and click_y == 1 and click == 1
                then
                    app_load = 0
                    new_load = 0
                    name_load = 0
                end
                end
            end
            if  click_x ==50 and click_y == 1 and click == 1
            then
                 app_load = 0
                 new_load = 0
                name_load = 0
            end
        end
    end
end
end