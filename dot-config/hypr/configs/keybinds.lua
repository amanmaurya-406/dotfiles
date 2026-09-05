-- -----------------------------------------------------
-- Key bindings
-- https://wiki.hypr.land/Configuring/Binds/
-- -----------------------------------------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local scripts = "$HOME/.config/hypr/scripts"

local terminal = "kitty"
local fileManager = "nautilus" --new-window
local menu = "rofi -show drun"
local browser = "firefox"
local calculator = "gnome-calculator"
local notification = "swaync-client -t -sw" -- swayNC panel

local left = "h"
local down = "j"
local up = "k"
local right = "l"

-- Windows control -----------------------------------------------------------
-- Commands
hl.bind(mainMod .. " + Q", hl.dsp.window.kill(hl.get_active_window()))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 0 })) -- Set active window to Fullscreen
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = 1 })) -- Maximize Window
-- hl.bind(mainMod .. " + T",  hl.dsp.window.)     -- toggle active window float
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.layout("allfloat")) -- Toggle all windows into floating mode
-- hl.bind(mainMod .. " + ALT+ F",  hl.dsp.exec_cmd(hl.dispatch.workspaceopt.allfloat) -- All windows float

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + " .. left, hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. right, hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. up, hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. down, hl.dsp.focus({ direction = "down" }))

-- Resize active window
hl.bind(
	mainMod .. " + SHIFT + " .. left,
	hl.dsp.window.resize({ x = -50, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	mainMod .. " + SHIFT + " .. right,
	hl.dsp.window.resize({ x = 50, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(mainMod .. " + SHIFT + " .. up, hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind(
	mainMod .. " + SHIFT + " .. down,
	hl.dsp.window.resize({ x = 0, y = 50, relative = true }),
	{ repeating = true }
)

-- Move active window
hl.bind(mainMod .. " + CTRL + " .. left, hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + " .. right, hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + " .. up, hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + " .. down, hl.dsp.window.move({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
-- hl.bind(mainMod .. " + mouse:272",
-- 	hl.dsp.window.drag()
-- , { mouse = true })
-- hl.bind(mainMod .. " + mouse:273",
-- 	hl.dsp.window.resize()
-- , { mouse = true })

-- Master Layout
hl.bind(mainMod .. " + CTRL + D", hl.dsp.layout("removemaster"))
hl.bind(mainMod .. " + I", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + J", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + K", hl.dsp.layout("cycleprev"))
-- hl.bind(mainMod .. " + M, exec, hyprctl dispatch splitratio 0.3

-- Groups
-- hl.bind(mainMod .. " + G, togglegroup
-- hl.bind = ALT, tab, changegroupactive  --change focus to another window
--

-- Workspaces ----------------------------------------------------------------
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move active window and follow to workspace mainMod + CTRL [0-9]
-- bind = $mainMod CTRL, 1, movetoworkspace, 1  -- Move active window to workspace 1
-- bind = $mainMod CTRL, 2, movetoworkspace, 2  -- Move active window to workspace 2
-- bind = $mainMod CTRL, 3, movetoworkspace, 3  -- Move active window to workspace 3
-- bind = $mainMod CTRL, 4, movetoworkspace, 4  -- Move active window to workspace 4
-- bind = $mainMod CTRL, 5, movetoworkspace, 5  -- Move active window to workspace 5
-- bind = $mainMod CTRL, 6, movetoworkspace, 6  -- Move active window to workspace 6
-- bind = $mainMod CTRL, 7, movetoworkspace, 7  -- Move active window to workspace 7
-- bind = $mainMod CTRL, 8, movetoworkspace, 8  -- Move active window to workspace 8
-- bind = $mainMod CTRL, 9, movetoworkspace, 9  -- Move active window to workspace 9
-- bind = $mainMod CTRL, 0, movetoworkspace, 10 -- Move active window to workspace 10

-- Move using tab
-- hl.bind(mainMod .. " + tab",
-- 	hl.dsp.focus({ workspace = hl.get_active_workspace() + 1 })
-- )
-- hl.bind(mainMod .. " + SHIFT + tab",
-- 	hl.dsp.focus({ workspace = hl.get_active_workspace() - 1 })
-- )

--

-- Scripts -------------------------------------------------------------------
-- Brightness control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scripts .. "/brightness.sh --inc"), { locked = true, repeating = true })
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd(scripts .. "/brightness.sh --dec"),
	{ locked = true, repeating = true }
)

-- Sound control
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scripts .. "/volume-control.sh --toggle"), { locked = true, repeating = true }) -- play/pause toggle
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(scripts .. "/volume-control.sh --inc"),
	{ locked = true, repeating = true }
) -- volume up
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(scripts .. "/volume-control.sh --dec"),
	{ locked = true, repeating = true }
) -- volume down
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd(scripts .. "/volume-control.sh --toggle-mic"),
	{ locked = true, repeating = true }
) -- mice toggle

-- Media control
hl.bind(
	mainMod .. " + SPACE",
	hl.dsp.exec_cmd(scripts .. "/media-control.sh --pause"),
	{ locked = true, repeating = true }
)
hl.bind(
	mainMod .. " + SHIFT + N",
	hl.dsp.exec_cmd(scripts .. "/media-control.sh --nxt"),
	{ locked = true, repeating = true }
)
-- hl.bind = $mainMod CTRL, N, hl.exec_cmd(scripts .. "/media-control.sh --prv"), { locked = true, repeating = true })

-- Screenshot keybindings NOTE: You may need to press Fn key as well
hl.bind("Print", hl.dsp.exec_cmd(scripts .. "/screenshot.sh --now"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(scripts .. "/screenshot.sh --area"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd(scripts .. "/screenshot.sh --win"))

-- Launchers
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(calculator))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notification))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(scripts .. "/clip-manager.sh"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(scripts .. "/powermenu.sh"))

-- Hyprland ------------------------------------------------------------------
hl.bind("CTRL + ALT + DELETE", hl.dsp.exit())
