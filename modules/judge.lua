local Judge = {}
local Rules = require("modules.rules")
Judge.__index = Judge

function Judge.new()
	local self = {}
	setmetatable(self, Judge)
	return Judge
end

function Judge:build()
	-- TODO:
end

function Judge:askPLayerTeam(player)
	-- TODO:
end

function Judge:askPlayerMove(player)
	-- TODO:
end

function Judge:verifyVictory()
	-- TODO:
end
