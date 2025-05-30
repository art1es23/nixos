local function setup(_, opts)
	local type = opts and opts.type or ui.Border.ROUNDED
	local old_build = Tab.build
	Tab.build = function(self, ...)
		local bar = function(c, x, y)
			if x <= 0 or x == self._area.w - 1 then
				return ui.Bar(ui.Bar.TOP)
			end
			return ui.Bar(ui.Bar.TOP)
				:area(
					ui.Rect { x = x, y = math.max(0, y), w = ya.clamp(0, self._area.w - x, 1), h = math.min(1, self._area.h) }
				)
				:symbol(c)
		end
		
		local c = self._chunks
		if not c or #c < 3 then
			return old_build(self, ...)
		end
		
		self._chunks = {
			c[1]:pad(ui.Pad.y(1)),
			c[2]:pad(ui.Pad(1, c[3].w > 0 and 0 or 1, 1, c[1].w > 0 and 0 or 1)),
			c[3]:pad(ui.Pad.y(1)),
		}
		
		-- Get border style with fallback
		local style = { fg = "#7aa2f7" }  -- Fallback blue color
		if THEME and THEME.manager and THEME.manager.border_style then
			style = THEME.manager.border_style
		end
		
		self._base = ya.list_merge(self._base or {}, {
			ui.Border(ui.Border.ALL):area(self._area):type(type):style(style),
			ui.Bar(ui.Bar.RIGHT):area(self._chunks[1]):style(style),
			ui.Bar(ui.Bar.LEFT):area(self._chunks[3]):style(style),
			bar("┬", c[1].right - 1, c[1].y),
			bar("┴", c[1].right - 1, c[1].bottom - 1),
			bar("┬", c[2].right, c[2].y),
			bar("┴", c[2].right, c[2].bottom - 1),
		})
		old_build(self, ...)
	end
end
return { setup = setup }
