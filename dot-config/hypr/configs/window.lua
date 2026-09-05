-- -----------------------------------------------------
-- General window layout and colors
-- https://wiki.hypr.land/Configuring/Variables/#general
-- -----------------------------------------------------

hl.config({
	general = {
		border_size = 1,
		gaps_in = 4,
		gaps_out = 8,

		resize_on_border = true,
		extend_border_grab_area = 15,

		-- https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
		col = {
			inactive_border = "rgba(595959aa)",
			active_border = {
				colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
				angle = 45,
			},
		},

		layout = "dwindle",

		-- https://wiki.hypr.land/Configuring/Variables/#snap
		snap = {
			enabled = false,
			window_gap = 10,
			monitor_gap = 10,
			border_overlap = false,
			respect_gaps = true,
		},
	},
})
