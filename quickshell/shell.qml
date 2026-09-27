import Quickshell
import QtQuick

// ShellRoot is the required top-level container for a Quickshell config.
ShellRoot {

    // Variants creates one instance of its delegate per entry in `model`.
    // Quickshell.screens is a *live* list of connected monitors, so bars
    // are created/destroyed automatically as you plug/unplug displays.
    Variants {
        model: Quickshell.screens

        delegate: Component {
            Bar {
                // `modelData` is injected by Variants — it's the screen
                // this particular delegate instance was created for.
                property var modelData
                screen: modelData
            }
        }
    }
}
