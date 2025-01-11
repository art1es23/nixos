local lazykeys = require("util.keymap").lazykeys
local ok, keymaps = pcall(require, "keymaps")
if ok then
	local generals = keymaps.generals
	lazykeys(generals)
end
