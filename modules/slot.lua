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

function Slot:get()
	return self.value
end

function Slot:setX()
	self.value = C.X
end

function Slot:setO()
	self.value = C.O
end

function Slot:setVoid()
	self.value = C.VOID
end

function Slot:showValue()
	local answer = self.value
	return answer
end

function Slot:show()
	self:showValue()
end

function Slot:test()
	if self.value == C.VOID then
		print(self.value)
		print("Slot:build() test OK")
	end
	self:setO()
	if self.value == C.O then
		print("Slot:setO test OK")
	end
	self:setX()
	if self.value == C.X then
		print("Slot:setX test OK")
	end
	print(self.value)
	print("Slot:Test OK")
end

return Slot
