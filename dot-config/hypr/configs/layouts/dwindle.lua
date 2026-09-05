-- ------------------------------------------------------------
-- Dwindle Layout
-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
-- ------------------------------------------------------------

hl.config({
	dwindle = {
		force_split = 2,
		preserve_split = true,
		smart_split = false,
		smart_resizing = true,
		permanent_direction_override = false,
		special_scale_factor = 0.8,
		split_width_multiplier = 1.0,
		use_active_for_splits = true,
		default_split_ratio = 1.0,
		split_bias = 0,
		precise_mouse_move = false,
	},

	binds = {
		workspace_back_and_forth = true,
		allow_workspace_cycles = true,
		pass_mouse_when_bound = false,
	},
})
