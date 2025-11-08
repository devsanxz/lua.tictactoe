local Mode = {}
Mode.__index = Mode
function Mode.new() -- NOTE: DECIDE if this will get args or will do differently
	self = {}
	setmetatable(self, Mode)
	self.name = self.askGameMode()
	return self
end

function Mode.askGameMode()
	print("Type 1 for Single Player Mode")
	print("Type 2 for Two Players Mode")
	io.read("n")
end

Mode.setMode = {
	[1] = function()
		-- TODO: NOW SHOULD CREATE PLAYERS? JUST SET VALUE AND PLAYER CREATOR DECIDES BASED ON THIS? DECIDE THOSE THINGS
	end,
	[2] = function()
		-- same above
	end,
}
