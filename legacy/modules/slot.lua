local Slot = {}
local C = require("modules.constants")
Slot.__index = Slot

function Slot.new()
	local self = {}
	setmetatable(self, Slot)
	self:build()
	return self
end

function Slot:build()
	self.value = C.VOID
end

function Slot:getX()
	self.value = C.X
end

function Slot:getO()
	self.value = C.O
end

function Slot:rebuild()
	self:build()
end

function Slot:test()
	print("Slot:test(OK)")
end

return Slot
