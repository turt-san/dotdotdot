import Quickshell
import Quickshell.Io
import QtQuick

// PanelWindow = a decorationless window glued to a screen edge via layer-shell.
// This file is a reusable *component* — shell.qml creates one per monitor.
PanelWindow {
    id: bar
    color: "black"

    anchors {
        top: true
        left: true
        right: true
    }
    height: 32

    // Reserve this space so windows don't get placed underneath the bar.
    exclusiveZone: height

    // ---- Left side: placeholder for workspaces ----------------------------
    Row {
        anchors {
            left: parent.left
            leftMargin: 12
            verticalCenter: parent.verticalCenter
        }
        spacing: 6

        Text {
            text: "1               2  3"   // swap this out for a real hyprland/workspaces
            color: "white"    // component later — this is just a placeholder
        }
    }

    // ---- Center: live clock -------------------------------------------------
    Text {
        id: clock
        anchors.centerIn: parent
        color: "white"

        Process {
            id: dateProc
            command: ["date", "+%H:%M:%S  %a %d %b"]
            running: true
            stdout: SplitParser {
                onRead: data => clock.text = data
            }
        }

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: dateProc.running = true
        }
    }

    // ---- Right side: system tray --------------------------------------------
    SystemTray {
        anchors {
            right: parent.right
            rightMargin: 12
            verticalCenter: parent.verticalCenter
        }
        // The tray needs a reference to this window so right-click menus
        // know what to anchor themselves to.
        barWindow: bar
    }
}
