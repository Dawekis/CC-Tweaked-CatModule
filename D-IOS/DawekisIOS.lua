local DIOS_load = 1
local screen = peripheral.find("monitor")
paintutils.drawFilledBox(1,1,50,18,colors.white)
sleep(1)
--开机动画
for i = 1,18,1 do
    sleep(0.1)
    paintutils.drawLine(1,i,50,i,colors.lightBlue)
end
sleep(0.5)
while DIOS_load == 1 do
    --导入和展示图标
    local icon_image = paintutils.loadImage(".DawekisIOS/Icon.nfp")
    paintutils.drawImage(icon_image,0,1)
    paintutils.drawLine(1,1,20,1,colors.lightBlue)
    sleep(1)
    for i = 1,18,1 do
        paintutils.drawLine(1,i,25/9*i,i,colors.lightBlue)
        paintutils.drawLine(50,18-i,50-25/9*i,18-i,colors.lightBlue)
        sleep(0.1)
    end
    local Dawekis_load = 1
    while Dawekis_load == 1 do
        local mainmenu_1 = paintutils.loadImage(".DawekisIOS/mainmenu_1/mainmenu_1.nfp")
        paintutils.drawBox(1,1,50,18,colors.black)
        paintutils.drawImage(mainmenu_1,1,1)
        --命名
        term.setCursorPos(1,1);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("MainMenu - <1>")
        --命名画图
        term.setCursorPos(4,8);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Paint")
        --命名计算器
        term.setCursorPos(15,8);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Calcultor")
        --命名函数拟合
        term.setCursorPos(28,8);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Function")
        --命名地形扫描
        term.setCursorPos(41,8);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Terrain")
        --命名关机和重启
        term.setCursorPos(1,16);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Shut&Reboot")
        --命名设备扫描
        term.setCursorPos(14,16);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Device List")
        --命名唱片机
        term.setCursorPos(30,16);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Record")
        --命名游戏文件夹
        term.setCursorPos(43,16);term.setTextColor(colors.white);term.setBackgroundColor(colors.black)
        print("Game")
        --监听鼠标
        local event,click, click_x, click_y = os.pullEvent("mouse_click")
        --关机
        if  click_x >= 1 and click_x <= 11 and click_y >= 9 and click_y <= 16 and click == 1
        then
                  --关机动画
            for i = 1,18,1 do
                paintutils.drawLine(1,i,25/9*i,i,colors.lightBlue)
                paintutils.drawLine(50,18-i,50-25/9*i,18-i,colors.lightBlue)
                sleep(0.1)
            end
            local bye_image = paintutils.loadImage(".DawekisIOS/bye.nfp")
            paintutils.drawImage(bye_image,1,1)
            sleep(1.5)
            for i = 1,18,1 do
                paintutils.drawLine(1,i,25/9*i,i,colors.black)
                paintutils.drawLine(50,18-i,50-25/9*i,18-i,colors.black)
                sleep(0.1)
            end
            Dawekis_load = 0
            DIOS_load = 0
        end
    if  click_x >= 1 and click_x <= 11 and click_y >= 9 and click_y <= 16 and click == 2
    then
        for i = 1,18,1 do
            paintutils.drawLine(1,i,25/9*i,i,colors.lightBlue)
            paintutils.drawLine(50,18-i,50-25/9*i,18-i,colors.lightBlue)
            sleep(0.1)
        end
        Dawekis_load = 0
        sleep(0.5)
    end
    --应用：打印可用设备表
    if  click_x >= 14 and click_x <= 24 and click_y >= 9 and click_y <= 16 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu_1/print_equipments_list")
    end
    --应用：唱片机
    if  click_x >= 27 and click_x <= 38 and click_y >= 9 and click_y <= 16 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu_1/record")
    end
    --应用：游戏文件夹
    if  click_x >= 40 and click_x <= 50 and click_y >= 9 and click_y <= 16 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu_1/games")
    end
    --应用：画图
    if  click_x >= 2 and click_x <= 11 and click_y >= 2 and click_y <= 7 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu_1/paint_app")
    end
    --应用：计算器
    if  click_x >= 14 and click_x <= 24 and click_y >= 2 and click_y <= 7 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu_1/calcultor")
    end
    --应用：函数拟合
    if  click_x >= 27 and click_x <= 38 and click_y >= 2 and click_y <= 7 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu_1/function")
    end
    --应用：地形扫描
    if  click_x >= 40 and click_x <= 50 and click_y >= 2 and click_y <= 7 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu_1/terrain")
    end
    --转变：前往菜单2
    if  click_x >= 30 and click_y == 17 and click == 1
    then
        shell.run(".DawekisIOS/mainmenu/mainmenu_2")
    end
    end
    shell.run("clear")
end