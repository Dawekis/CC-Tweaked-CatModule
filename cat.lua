
--===================================================================================================--
--===============这个注释没有什么意义，它只是表明cat-文件处理&图形模块是由Dawekis开发的==================--
--===================================================================================================--
--===================================================================================================--
--===================              ======              =====              ===========================--
--===================    ================    ======    ==========    ================================--
--===================    ================    ======    ==========    ================================--
--===================    ================              ==========    ================================--
--===================    ================    ======    ==========    ================================--
--===================              ======    ======    ==========    ================================--
--===================================================================================================--
--===================================================================================================--

-----------------------------------------建立模块表cat--------------------------------------------
--注释：建立名为cat的模块表，以方便后续调用

cat = {}

--=============================================图形处理=============================================--
------------------------------------------自定义窗口-----------------------------------------------
--注释：cat.setBackground(x轴位置，y轴位置，长，高，颜色(透明则填“”)，是否带框[blink]，是否带关闭图标[blink])

function cat.setBackground(x,y,long,high,color,borders_blink,close_blink)
    if borders_blink == true and color ~= ""
     then
        paintutils.drawFilledBox(x,y,x+long-1,y+high-1,color)
        paintutils.drawBox(x,y,x+long-1,y+high-1,colors.black)
     elseif borders_blink ~= true and color ~= ""
     then
        paintutils.drawFilledBox(x,y,x+long-1,y+high-1,color)
    elseif close_blink == true
    then
        paintutils.drawPixel(x+long-1,y+high-1,colors.red)
    elseif borders_blink == true and color == ""
    then
        paintutils.drawBox(x,y,x+long-1,y+high-1,colors.black)
    end
end

---------------------------------------自定义横线-------------------------------------------------
--注释：cat.Line_H(x轴位置，y轴位置，长度表，颜色表）

function cat.Line_H(x,y,long_table,color_table)
    if #long_table == #color_table
    then
        paintutils.drawLine(x,y,x+long_table[1]-1,y,color_table[1])
        if #long_table ~= 1
        then
            for i = 2,#long_table,1 do
                --叠加横线，横线全部居中
                paintutils.drawLine((x+long_table[1]-1)/2-long_table[2]/2,y,(x+long_table[1]-1)/2+long_table[2]/2,y,color_table[i])
            end
        end
    end
end

---------------------------------------自定义竖线-------------------------------------------------
--注释：cat.Line_H(x轴位置，y轴位置，高度表，颜色表）

function cat.Line_V(x,y,high_table,color_table)
    if #high_table == #color_table
    then
        paintutils.drawLine(x,y,x,y+high_table[1]-1,color_table[1])
        if #long_table ~= 1
        then
            --叠加竖线，竖线全部居中
            for i = 2,#long_table,1 do
                paintutils.drawLine(x,(y+high_table[1]-1)/2-high_table[2]/2,x,(y+high_table[1]-1)/2+high_table[2]/2,color_table[i])
            end
        end
    end
end

----------------------------------------加载nfp图片---------------------------------------------------
--注释：cat.loadBackground(x轴位置，y轴位置，nfp图片路径)

function cat.loadBackground(x,y,path)
    local image = paintutils.loadImage(path)
    paintutils.drawImage(image,x,y)
end

---------------------------------------------生成&加载nfp图标----------------------------------------------
--注释：cat.Icon(x轴位置，y轴位置，nfp图标路径(不填，则使用默认图标))

function cat.Icon(x,y,path)
    if path == nil
    then
        local image = paintutils.loadImage("Icon.nfp")
        paintutils.drawImage(image,x,y)
    else
        local image = paintutils.loadImage(path)
        paintutils.drawImage(image,x,y)
    end
    return
    {x,y}
end

--------------------------------------自定义横栏菜单----------------------------------------
--注释：cat.Button_Line(菜单表，x轴位置，y轴位置，文本颜色，文本背景颜色)

function cat.Button_Line(str_table,x,y,long,text_color,background_color)
    local str = "|"
    if x == nil or y == nil and long == nil and text_color == nil or background_color == nil
    then
        paintutils.drawLine(2,2,50,2,colors.white)
        term.setCursorPos(2,2);term.setBackgroundColor(colors.white);term.setTextColor(colors.black)
        --遍历打印菜单名
        for i = 1,#str_table,1 do
            str = str..str_table[i].."|"
        end
    else
        paintutils.drawLine(x,y,x+long-1,y,color)
        term.setCursorPos(x,y);term.setBackgroundColor(background_color);term.setTextColor(text_color)
        --遍历打印菜单名
        for i = 1,#str_table,1 do
            str = str..i.."|"
        end
    end
    print(str)
end


---------------------------------------图标按钮-----------------------------------
--注释：cat.BUtton_Icon(图标变量名(需要已经定义过的)，需要运行的lua程序，监听鼠标的x轴变量名，监听鼠标的y轴变量名，监听鼠标的点击变量名)
--该函数需要和 os.pullEvent("mouse_click") 一同使用，click_x,click_y,click必须为被 os.pullEvent("mouse_click") 定义的变量

function cat.Button_Icon(Icon,shell_lua,click_x,click_y,click)
    local x = Icon[1]
    local y = Icon[2]
    if click_x >= x and click_x <= x+10 and click_y >= y and click_y <= y+6 and click == 1
    then
        --运行shell_lua
        if shell_lua ~= ""
        then
            shell.run(shell_lua)
            --不运行shell_lua，被点击时输出true
        elseif shell_lua == ""
        then
            return
            true
        end
    end
end

--------------------------------------------自定义按钮----------------------------------
--注释：cat.BUtton_(x轴位置，y轴位置，长，高，需要运行的lua程序，监听鼠标的x轴变量名，监听鼠标的y轴变量名，监听鼠标的点击变量名)
--该函数需要和 os.pullEvent("mouse_click") 一同使用，click_x,click_y,click必须为被 os.pullEvent("mouse_click") 定义的变量

function cat.Button(x,y,long,high,shell_lua,click_x,click_y,click)
    if click_x >= x and click_x <= x+long-1 and click_y >= y and click_y <= y+high-1 and click == 1
    then
        --运行shell_lua
        if shell_lua ~= ""
        then
            shell.run(shell_lua)
            --不运行shell_lua，被点击时输出true
        elseif shell_lua == ""
        then
            return
            true
        end
    end
end

----------------------------------------遍历打印文件名称------------------------------------------
--注释：cat.Flie_List(x轴位置，y轴位置，行数，页数，文件目录路径)
--使用时尽量使页数为可变变量，否则其输出的文件列表会被定死。

function cat.Flie_List(x,y,line_num,page_num,flie_path)
    local flie_list = fs.list(flie_path)
    local m = math(#flie_list/line)
    term.setCursorPos(x,y)
    if #flie_list >= line_num and page_num <= m
    then
        for i = page_num+line*(page_num-1),line_num,1 do
            print(flie_list[i])
        end
    elseif #flie_list< line_num or page_num > m
    then
        for i = page_num+line*(page_num-1),#flie_list,1 do
            print(flie_list[i])
        end
    end
    --输出页数
    return
    page_num
end

------------------------------------------------------------------------------------------------------

function cat.play(x,y,flie_path)
    
end