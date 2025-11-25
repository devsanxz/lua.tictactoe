local Main = {}
local Board = require("modules.board")

function Main.testBoard()
	local board = Board.new()
	board:test()
end

Main.testBoard()
