local Board = {}
local Slot = require("modules.slot")
Board.__index = Board

function Board.new()
	local self = {}
	setmetatable(self, Board)
	self:build()
	return self
end

function Board:build()
	self.slots = {}
	for i = 1, 9, 1 do
		self.slots[i] = Slot.new()
	end
end

function Board:test()
	for key, value in pairs(self.slots) do
		if !value then
			print("Error creating slot #" .. key)
			break
		end
	end
	print("Board:test(OK)")
end

return Board
