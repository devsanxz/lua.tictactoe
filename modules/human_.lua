local Human = {}
local Slot = require("modules.slot")

Human.__index = Human
function Human.new()
	local self = {}
	setmetatable(self, Human)
	self:build()
	return self
end

function Human:build()
	self.team = Slot.new()
end

function Human:askSide(side)
	print("Choose either X or O team:")
	io.read("l")
end

return Human
