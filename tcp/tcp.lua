fun = {}
fun.Establish = function(clientID)
tcp = {}
tcp.pub = ""
tcp.pri = ""
tcp.pk = ""
tcp.finalKey = ""
tcp.clientID = clientID
function kp()
	local ecdh = require("EllipticCurveCryptography.init")
	tcp.pri, tcp.pub = ecdh.keypair(os.time())
end

kp()

function split(str, dl)
	local result = {}
	local pat = string.format("([^%s]+)", dl)
	for part in string.gmatch(str, pat) do
		table.insert(result, part)
	end
end

tcp.BuildServer = function ()
	local box = peripheral.find("chatBox")
	box.sendMessage(string.format("$%s %s ECDHS %s", os.getComputerID(), tcp.clientID, tcp.pub))
	while true do
		local event, username, message, uuid, isHidden = os.pullEvent("chat")
		if string.match(message, os.getComputerID()) then
			if string.match(message, "ECDHR") then
				local tb_msg = split(message, " ")
				if tb_msg ~= nil and tb_msg.len == 3 then
					local sender = tb_msg[0]
					if sender == clientID then
						tcp.pk = tb_msg[3]
						local ecdh = require("EllipticCurveCryptography.init")
						tcp.finalKey = ecdh.exchange(tcp.pri, tcp.pk).toHex()
						print("Connections are established")
						break
					end
				else
					goto cons
				end
			else
				goto cons
			end
		end
		::cons::
	end
	return tcp
end

tcp.BuildClient = function ()
	local box = peripheral.find("chatBox")
	while true do
		local event, username, message, uuid, isHidden = os.pullEvent("chat")
		if string.match(message, os.getComputerID()) then
			if string.match(message, "ECDHS") then
				local tb_msg = split(message, " ")
				if tb_msg ~= nil and tb_msg.len == 3 then
					local sender = tb_msg[0]
					if sender == clientID then
						tcp.pk = tb_msg[3]
						local ecdh = require("EllipticCurveCryptography.init")
						tcp.finalKey = ecdh.exchange(tcp.pri, tcp.pk).toHex()
						box.sendMessage("$%s %s ECDHR %s", os.getComputerID(), sender, tcp.pub)
						print("Connections are established")
						break
					end
				end
			end
		end
	end
	return tcp
end

tcp.SendTcpData = function(msg)
	local box = peripheral.find("chatBox")
	if box ~= nil then
		local ecdh = require("EllipticCurveCryptography.init")
    	local encodingMsg = ecdh.encrypt(msg, tcp.finalKey).toHex()
		local sign = ecdh.sign(tcp.pri, "Sign0010").toHex()
		box.sendMessage("$%s %s INFO %s %s", os.getComputerID(), tcp.clientID, encodingMsg, sign)
	    return true
	end
	return false
end

tcp.ReceiveTcpData = function(func)
	while true do
		local event, username, message, uuid, isHidden = os.pullEvent("chat")
		if string.match(message, os.getComputerID()) then
			if string.match(message, "INFO") then
				local tb_msg = split(message, " ")
				if tb_msg ~= nil and tb_msg.len == 4 then
					local sender = tb_msg[0]
					if sender == clientID then
						local ecdh = require("EllipticCurveCryptography.init")
						local sign = ecdh.verify(tcp.pk, "Sign0010", tb_msg[4])
						if sign then
							local msg = ecdh.decrypt(tb_msg[3], tcp.finalKey).toHex()
							return func(sender, msg)
						end
					end
				end
			end
		end
	end
end
	print("Instance is established")
	return tcp
end

return fun
