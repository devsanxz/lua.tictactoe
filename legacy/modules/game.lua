local Game = {}
local Board = require("modules.board")
local Judge = require("modules.judge")
local Player = require("modules.player")
Game.__index = Game

function Game.new()
	local self = {}
	setmetatable(self, Game)
	local msg = self:build()
	return self
end

function Game:build()
	local msg = 0
	self.board = Board.new()
	self.judge = Judge.new()
	self.player = Player.new()
	return msg
end

function Game:start()
	--test code
	self:test()
end

function Game:test()
	if self.board then
		print("Board created OK")
	end
	if self.player then
		print("Input created OK")
	end
	if self.judge then
		print("Judge created OK")
	end
	print("Game:build(OK)")
	self.board:test()
	self.player:test()
	self.judge:test()
	print("Game Elements Tests (OK)")
end

return Game
