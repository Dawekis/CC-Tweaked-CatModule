-- random.lua - Random Byte Generator
local sha256 = require("sha256")

local entropy = ""
local accumulator, accumulator_len = {}, 0

local function feed(data)
	accumulator_len = accumulator_len + 1
	accumulator[accumulator_len] = tostring(data or "")
end

local function digest()
	entropy = tostring(sha256.digest(entropy .. table.concat(accumulator)))
	accumulator_len = 0
end

feed("init")
feed(math.random(1, 2 ^ 31 - 1))
feed("|")
feed(math.random(1, 2 ^ 31 - 1))
feed("|")
feed(math.random(1, 2 ^ 4))
feed("|")
feed(os.time())
feed("|")
for _ = 1, 10000 do
	feed(tostring({}):sub(-8))
end
digest()
feed(os.time())
digest()

local function save()
	feed("save")
	feed(os.time)
	feed({})
	digest()

	entropy = tostring(sha256.digest(entropy))
end
save()

local function seed(data)
	feed("seed")
	feed(os.time())
	feed({})
	feed(data)
	digest()
	save()
end

local function random()
	feed("random")
	feed(os.time())
	feed({})
	digest()
	save()

	local result = sha256.hmac("out", entropy)
	entropy = tostring(sha256.digest(entropy))

	return result
end

return {
	seed = seed,
	save = save,
	random = random,
}
