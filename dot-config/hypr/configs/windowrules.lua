-- --------------------------------------------------------------
-- Window rules
-- https://wiki.hypr.land/Configuring/Window-Rules/#window-rules
-- --------------------------------------------------------------

-- Suppress maximize events globally
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- No shadow and No dim for tiled windows
hl.window_rule({
	name = "no-shadow",
	match = { class = ".*" },
	no_dim = true,
	no_shadow = true,
})

-- Idle inhibit when fullscreen
hl.window_rule({
	name = "idle-inhibit-fullscreen",
	match = { fullscreen = true },
	idle_inhibit = "fullscreen",
})

-- Float common utility windows ---------------------------------
-- PolicyKit agent
hl.window_rule({
	name = "float-polkit",
	match = { class = "polkit-gnome-authentication-agent-1" },
	float = true,
})

-- Blueman Manager
hl.window_rule({
	name = "blueman-manager",
	match = { class = "blueman-manager" },
	float = true,
	center = true,
	size = "650 500",
})

-- nm-connection-editor
hl.window_rule({
	name = "nm-connection-editor",
	match = { class = "nm-connection-editor" },
	float = true,
	center = true,
	size = "800 700",
})

-- Gnome Calculator
hl.window_rule({
	name = "gnome-calculator",
	match = { class = "org.gnome.Calculator" },
	float = true,
	center = true,
	size = "700 600",
})

-- Opacity Rules ------------------------------------------------
-- opacity = focused unfocused
hl.window_rule({
	name = "chromium-opacity",
	match = { class = "chromium" },
	opacity = "0.8 0.8",
})

hl.window_rule({
	name = "kitty-opacity",
	match = { class = "kitty" },
	opacity = "1.0 1.0",
})

hl.window_rule({
	name = "neovim-opacity",
	match = { title = "^nv.*" },
	opacity = "1.0 1.0",
})

hl.window_rule({
	name = "nautilus-opacity",
	match = { class = "org.gnome.Nautilus" },
	opacity = "0.7 0.7",
})

-- Picture-in-Picture (PIP) -------------------------------------
hl.window_rule({
	name = "Picture-in-Picture",
	match = { title = "Picture-in-Picture" },

	float = true,
	pin = true,
	-- size = 25% 25%
	-- move = 72% 7%
	opacity = "1.0 1.0",
})

-- Fix XWayland Drag Issues -------------------------------------
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- --------------------------------------------------------------
-- Layer rules
-- https://wiki.hypr.land/Configuring/Window-Rules/#layer-rules
-- --------------------------------------------------------------

-- SwayNC
hl.layer_rule({ blur = true, match = { namespace = "swaync-control-center" } })

hl.layer_rule({ blur = true, match = { namespace = "swaync-notification-window" } })

-- hl.layer_rule"({ignorezero, swaync-control-center"})
-- hl.layer_rule({ignorezero, swaync-notification-window)}

hl.layer_rule({ ignore_alpha = 0.5, match = { namespace = "swaync-control-center" } })

hl.layer_rule({ ignore_alpha = 0.5, match = { namespace = "swaync-notification-window" } })

-- Rofi,
hl.layer_rule({ blur = true, match = { namespace = "rofi" } })
