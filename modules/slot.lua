local Slot = {}
Slot.__index = Slot
local C = require("modules.constants")

function Slot.new()
	local self = {}
	setmetatable(self, Slot)
	self:build()
	return self
end

function Slot:build()
	self.value = ""
	self.value = C.VOID
end

function Slot:getX()
	self.value = C.X
end

function Slot:getO()
	self.value = C.O
end

function Slot:getVoid()
	self.value = C.VOID
end

function Slot:showValue()
	return self.value
end

function Slot:test()
	if self.value == C.VOID then
		print(self.value)
		print("Slot:build() test OK")
	end
	self:getO()
	if self.value == C.O then
		print("Slot:getO test OK")
	end
	self:getX()
	if self.value == C.X then
		print("Slot:getX test OK")
	end
	print(self.value)
	print("Slot:Test OK")
end

return Slot
