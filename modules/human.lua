local Human = {}
Human.__index = Human
function Human.new()
	local self = {}
	setmetatable(self, Human)
	self:build()
	return self
end

function Human:build()
	-- TODO: kinda obvious, getting tired
end

return Human
