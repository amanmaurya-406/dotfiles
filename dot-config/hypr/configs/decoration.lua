-- ------------------------------------------------------------------
-- Window decoration
-- https://wiki.hypr.land/Configuring/Variables/#decoration
-- ------------------------------------------------------------------

hl.config({
	decoration = {
		rounding = 12,
		rounding_power = 2.0,

		-- Change transparency of focused and unfocused windows
		active_opacity = 0.7,
		inactive_opacity = 0.7,
		fullscreen_opacity = 0.7,

		dim_inactive = false,
		dim_strength = 0.35,

		-- https://wiki.hypr.land/Configuring/Variables/#blur
		blur = {
			enabled = true,
			size = 5,
			passes = 3,
			ignore_opacity = true,
			new_optimizations = true,
			xray = false,
			vibrancy = 0.29,
			popups = true,
		},

		-- https://wiki.hypr.land/Configuring/Variables/#shadow
		shadow = {
			enabled = true,
			range = 4,
			render_power = 2,
		},
	},
})
