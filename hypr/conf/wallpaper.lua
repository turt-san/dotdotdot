local mainMonitor = "eDP-1"
local mainWallpaper = "~/Images/Wallpapers/feather.png"

if mainWallpaper then
	hl.exec_cmd("hyprctl hyprpaper preload " .. mainWallpaper)
	hl.exec_cmd("hyprctl hyprpaper wallpaper '" .. mainMonitor .. "," .. mainWallpaper .. ",cover'")
end

-- Examples
-- hyprctl hyprpaper unload "~/Pictures/wallpaper.png"
-- hyprctl hyprpaper unload all
-- hyprctl hyprpaper unload unused
