-- ---------------------------------------------------------
-- Gestures
-- https://wiki.hypr.land/Configuring/Gestures
-- ---------------------------------------------------------

hl.config({
	gestures = {
		workspace_swipe_forever = false,
	},
})

-- Workspaces
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Windows
hl.gesture({
	fingers = 4,
	direction = "swipe",
	action = "move",
})

-- Fullscreen on
hl.gesture({
	fingers = 4,
	direction = "pinchin",
	action = function()
		hl.dispatch(hl.dsp.window.fullscreen({ action = "set" }))
	end,
})

-- Fullscreen off
hl.gesture({
	fingers = 4,
	direction = "pinchout",
	action = function()
		hl.dispatch(hl.dsp.window.fullscreen({ action = "unset" }))
	end,
})
