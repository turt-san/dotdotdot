import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

RowLayout {
    anchors {
        rightMargin: 10
        verticalCenter: parent.verticalCenter
    }

    spacing: 5

    Repeater {
        model: SystemTray.items

        Item {
            id: trayItem
            required property SystemTrayItem modelData

            implicitWidth: 28
            implicitHeight: 28

            property bool isHovered: mouseArea.containsMouse

            Rectangle {
                anchors.fill: parent
                radius: 6
                // Replicates the responsive backdrop typical of Caelestia modules
                color: parent.isHovered ? "rgba(0, 0, 0, 0.6)" : Colors.accent
                // behavior on color {
                //     ColorAnimation {
                //         duration: 150
                //     }
                // }
            }

            Image {
                id: iconImage
                height: 20
                width: 20
                anchors.centerIn: parent
                source: trayItem.modelData.icon
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton

                onClicked: mouse => {
                    if (mouse.button === Qt.RightButton) {
                        if (trayItem.modelData.hasMenu) {
                            menuAnchor.open();
                        }
                    } else if (mouse.button === Qt.MiddleButton) {
                        trayItem.modelData.secondaryActivate();
                    } else {
                        trayItem.modelData.activate();
                    }
                }

                QsMenuAnchor {
                    id: menuAnchor

                    anchor.item: trayItem
                    anchor.edges: Edges.Bottom
                    anchor.gravity: Edges.Bottom | Edges.Left

                    menu: trayItem.modelData.menu
                }
            }

            // ToolTip {
            //     visible: mouseArea.containsMouse && (modelData.tooltipTitle !== "" || modelData.tooltipDescription !== "")
            //     text: modelData.tooltipTitle ? modelData.tooltipTitle : modelData.tooltipDescription
            //     delay: 500
            // }
        }
    }
}
