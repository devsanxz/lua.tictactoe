local Main = {}
local Board = require("modules.board")

function Main.testBoard()
	local board = Board.new()
	board:test()
	board:play("X", 5)
	-- board:play("3", 0) -- tests OK for both errors
	-- also tests ok for forbidding playing unempty space
	board:show()
	board:reset()
	board:show()
end

Main.testBoard()
