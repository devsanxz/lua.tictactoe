local Board = {}
local Box = require("modules.box")

Board.__index = Board
Board.WIDTH = 3

function Board.new()
	local self = {}
	setmetatable(self, Board)
	self:setupSelf()
	return self
end

function Board:getState()
	local state = ""
	for i = 1, 9, 1 do
		state = state .. self.box[i]:getLabel()
	end
	return state
end

function Board:play(who, where)
	self.box[where]:play(who)
end

function Board:printState()
	local state = self:getState()
	print(state)
end

function Board:setEmpty()
	self.box = {}
	for i = 1, (self.WIDTH ^ 2), 1 do
		self.box[i] = Box.new()
	end
end

function Board:setupSelf()
	self:setEmpty()
end

function Board:show()
	self:printState()
end

function Board:test()
	print("This is a test.")
	self:show()
	self:play("X", 1)
	self:play("O", 3)
	self:show()
	print("End of the test.")
end

return Board
