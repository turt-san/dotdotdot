local mainWallpaper = "~/Images/Wallpapers/feather.png"

if mainWallpaper then
	hl.on("hyprland.start", function()
		hl.exec_cmd("hyprctl hyprpaper preload " .. mainWallpaper)
		hl.exec_cmd("hyprctl hyprpaper wallpaper 'DP-1," .. mainWallpaper .. ",cover'")
	end)
end

-- Examples
-- hyprctl hyprpaper unload "~/Pictures/wallpaper.png"
-- hyprctl hyprpaper unload all
-- hyprctl hyprpaper unload unused
