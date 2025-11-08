-- required modules
local Board = require("modules.board")
local Player = require("modules.player")
local Mode = require("modules.mode")
local Round = require("modules.round")
local Game = {}

Game.__index = Game

function Game.new()
	self = {}
	setmetatable(self, Game)
	self:startNew()
	return self
end

function Game:startNew()
	self.board = Board.new()
	self.mode = Mode.new()
	self.player = Player.new()
	self.round = Round.new()
end
