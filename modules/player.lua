-- TODO: MAKE THIS A CLASS AND INSTANTIATE FOR EACH SIDE, CONNECTING TO A TWO PLAYER OR SINGLE PLAYER API
-- NOTE: I KNOW IT'S A LOT OF WORK BUT I'M FEELING MUCH CODE IS GONNA BE REUSABLE FOR OTHER PROJECTS

local Label = require("modules.label")
local Player = {}

Player.__index = Player

function Player.new(kind)
	self = {}
	setmetatable(self, Player)
	self.kind = kind
	self.input = self:makeInput(kind)
	self.label = Label.new()
	return self
end

function Player:makeInput(kind)
	local input = {}
	input = {
		function human()
			print("It's your turn. Type your move, single digit 1~9 or line column pair, each 1~3. Then <ENTER>")
			io.read("n")
		end,
		function cpu()
			
		end,
	}
	
	end
	return input[kind]
end
