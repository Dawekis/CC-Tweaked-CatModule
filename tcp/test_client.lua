local tcp = require("tcp")
while true do
    tcp.ReceiveTcpData(10, function (sender, msg)
        print(msg)
    end)
end