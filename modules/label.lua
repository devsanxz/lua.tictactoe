-- THIS IS A CLASS

local Label = {}

Label.__index = Label

function Label.new()
	local self = {}
	setmetatable(self, Label)
	self:makeAttributes()
	return self
end

function Label:makeAttributes()
	self.value = "V"
end

function Label:getValue()
	return self.value
end

function Label:setX()
	self.value = "X"
end

function Label:setO()
	self.value = "O"
end

function Label:setValue(value)
	self.value = value
end

function Label:testMe()
	print(self:getValue())
	self:setX()
	print(self:getValue())
	self:setO()
	print(self:getValue())
end

return Label
