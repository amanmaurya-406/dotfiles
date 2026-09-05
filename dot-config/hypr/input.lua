-- ---------------------------------------------------------
-- Input
-- https://wiki.hyprland.org/Configuring/Variables/#input
-- ---------------------------------------------------------

hl.config({
	input = {
		kb_model = "",
		kb_layout = "us",
		kb_variant = "",
		kb_options = "caps:escape",
		kb_rules = "",

		numlock_by_default = true,
		repeat_rate = 50,
		repeat_delay = 300,

		sensitivity = 0.5, -- [-1.0, 1.0], 0 means no modification.
		accel_profile = "adaptive",

		left_handed = false,
		follow_mouse = 1,
		float_switch_override_focus = 0,

		touchpad = {
			disable_while_typing = true,
			natural_scroll = false,
			scroll_factor = 2.0,
			middle_button_emulation = true,
			clickfinger_behavior = false,
			tap_to_click = true,
			drag_lock = 0,
		},
	},
})
