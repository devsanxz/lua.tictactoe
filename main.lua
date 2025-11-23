local Main = {}
local Slot = require("modules.slot")

function Main:testSlot()
	local slot = Slot.new()
	slot:test()
end

Main:testSlot()
