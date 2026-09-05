--     _         _            _             _
--    / \  _   _| |_ ___  ___| |_ __ _ _ __| |_
--   / _ \| | | | __/ _ \/ __| __/ _` | '__| __|
--  / ___ \ |_| | || (_) \__ \ || (_| | |  | |_
-- /_/   \_\__,_|\__\___/|___/\__\__,_|_|   \__|
--

hl.on("hyprland.start", function()
	-- Load cursor
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")

	-- Load wallpaper
	hl.exec_cmd("hyprpaper")

	-- Start PolicyKit (polkit) authentication agent daemon
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

	-- Load GTK settings
	hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")

	-- Using hypridle to start hyprlock
	hl.exec_cmd("pgrep -x 'hypridle' > /dev/null || hypridle")

	-- Load cliphist history
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Environment for xdg-desktop-portal-hyprland
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	hl.exec_cmd("waybar") -- Load waybar
	hl.exec_cmd("swaync") -- Load Notification Daemon
	hl.exec_cmd("kitty") -- Start terminal
end)
