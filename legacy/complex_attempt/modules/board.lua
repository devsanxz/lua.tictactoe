local Slot = require("modules.slot")
local C = require("modules.constants")
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
	local line = ""
	for i = 1, 9 do
		line = line .. "[" .. self.slots[i]:get() .. "]"
		if i % 3 == 0 then
			print(line)
			line = ""
		end
	end
end

function Board:play(what, where)
	if where < 1 or where > 9 then
		print("ERROR: where should be 1 to 9")
	else
		if self.slots[where]:isEmpty() then
			if what == C.X then
				self.slots[where]:setX()
			elseif what == C.O then
				self.slots[where]:setO()
			else
				print("ERROR: what is neither X or O")
			end
		else
			print("You should play an empty slot")
		end
	end
end

function Board:reset()
	self:build()
end

function Board:test()
	self:build()
	self:showEachSlot()
	self:show()
end

return Board
