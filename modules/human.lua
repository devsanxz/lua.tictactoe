local Human = {}
local G = require("modules.grid")
Human.__index = Human

function Human.new()
	local self = {}
	setmetatable(self, Human)
	self:build()
	return self
end

function Human:build()
	self.team = "_"
	self.number = 0
end

function Human:isAskedTeam()
	print("Which team you choose?")
	local answer = ""
	repeat
		print("Type X or O and press ENTER.")
		answer = io.read()
	until answer == "X" or answer == "O"
	print("You chose: " .. answer)
	return answer
end

function Human:isAskedTarget()
	local answer = 0
	local line = 0
	local column = 0
	repeat
		print("Type the number of the line you wanna play:")
		line = io.read("n")
		print("Type the number of the column you wanna play:")
		column = io.read("n")
	until line <= 3 and line >= 1 and column <= 3 and column >= 1
	print("You chose (" .. line .. "," .. column .. ")")
	return G[line][column]
end

return Human

-- local dummy = Human.new()
-- local dummyTeam = dummy:isAskedTeam()
-- print(dummyTeam)
-- local dummyTarget = dummy:isAskedTarget()
-- print(dummyTarget)
