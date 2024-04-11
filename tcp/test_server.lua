local tcp = require("tcp")
while true do
    tcp.SendTcpData("client", "Hello World!", 10)
    print("Send -> Client :: Hello World!")
end