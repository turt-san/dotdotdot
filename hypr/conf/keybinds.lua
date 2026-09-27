hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
hl.bind(
	"Print",
	hl.dsp.exec_cmd(
		"grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name') ~/Images/Screenshots/Screenshot_$(date +%Y%m%d_%H%M%S).png"
	)
)
