import QtQuick
import QtQuick.Controls               // ToolTip
import Quickshell
import Quickshell.Widgets              // IconImage
import Quickshell.Services.SystemTray

// Drop this file (and TrayMenu.qml) next to Bar.qml and use it as
// <SystemTray { barWindow: someWindow } />
Row {
    id: trayRow
    spacing: 8

    // Must be set by whoever instantiates this component (see Bar.qml).
    property var barWindow

    // App IDs to hide from the tray entirely, e.g. ["blueman", "nm-applet"].
    // Set this from Bar.qml if you want to hide specific icons.
    property var hiddenIcons: []

    Repeater {
        model: SystemTray.items

        Item {
            id: trayItem
            required property SystemTrayItem modelData

            // Real-world configs (e.g. caelestia-shell) filter out icons
            // the user asked to hide, and icons the app itself marked
            // "Passive" (idle/unimportant), instead of showing dead icons
            // forever.
            readonly property bool hidden: trayRow.hiddenIcons.includes(modelData.id)
                || modelData.status === SystemTrayItem.Status.Passive

            // Row is a positioner and skips invisible children when laying
            // things out, so a hidden item collapses instead of leaving a
            // gap in the tray.
            visible: !hidden
            width: hidden ? 0 : 20
            height: hidden ? 0 : 20

            IconImage {
                anchors.fill: parent
                source: trayItem.modelData.icon
                implicitSize: 20
            }

            // Draws the app's right-click menu ourselves (see TrayMenu.qml)
            // instead of relying on SystemTrayItem.display(), which needs
            // QApplication mode and ignores your theme even then.
            TrayMenu {
                id: trayMenu
                anchorItem: trayItem
                barWindow: trayRow.barWindow
                rootMenu: trayItem.modelData.menu
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                hoverEnabled: true

                onClicked: mouse => {
                    if (mouse.button === Qt.LeftButton) {
                        // Some tray items (onlyMenu) do nothing on activate
                        // and only ever offer a menu - e.g. some indicator
                        // applets. Route those straight to the menu.
                        if (trayItem.modelData.onlyMenu && trayItem.modelData.hasMenu) {
                            trayMenu.open();
                        } else {
                            trayItem.modelData.activate();
                        }
                    } else if (mouse.button === Qt.RightButton && trayItem.modelData.hasMenu) {
                        trayMenu.open();
                    } else if (mouse.button === Qt.MiddleButton) {
                        trayItem.modelData.secondaryActivate();
                    }
                }

                onWheel: wheel => trayItem.modelData.scroll(wheel.angleDelta.y, false)

                ToolTip.visible: containsMouse && !trayMenu.visible
                ToolTip.text: trayItem.modelData.tooltipTitle
            }
        }
    }
}
