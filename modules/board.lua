local Slot = require("modules.slot")
local Board = {}
Board.__index = Board

function Board.new()
	local self = {}
	setmetatable(self, Board)
	return self
end

function Board:build()
	self.slots = {}
	self.slots = self:createSlots()
end

function Board:createSlots()
	local slots = {}
	for i = 1, 9 do
		slots[i] = Slot.new()
	end
	return slots
end

function Board:showEachSlot()
	-- code for showing board 3x3
	for i = 1, 9 do
		self.slots[i]:show()
	end
end

function Board:show()
	-- TODO:CONTINUE FROM HERE:
	local line = ""
	for i = 1, 9 do
		line = line .. "[" .. self.slots[i]:get() .. "]"
		if i % 3 == 0 then
			print(line)
			line = ""
		end
	end
end

function Board:test()
	self:build()
	self:showEachSlot()
	self:show()
end

return Board
