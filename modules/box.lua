-- THIS IS A CLASS
local Label = require("modules.label")
local Box = {}

Box.__index = Box

function Box.new()
	local self = {}
	self.label = Label.new()
	setmetatable(self, Box)
	return self
end

function Box:getLabel()
	return self.label:getValue()
end

function Box:play(who)
	self.label:setValue(who)
end

function Box:show()
	print("[" .. self:getLabel() .. "]")
end

return Box
