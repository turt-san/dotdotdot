import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData
            screen: modelData
            anchors {
                top: true
                left: true
                right: true
            }
            implicitHeight: 36

            property var hyprMonitor: Hyprland.monitorFor(screen)

            RowLayout {
                anchors {
                    leftMargin: 6
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                spacing: 6

                Repeater {
                    model: Hyprland.workspaces.values.filter(ws => ws.monitor === bar.hyprMonitor)

                    Rectangle {
                        width: 24
                        height: 24
                        radius: 4
                        color: modelData.active ? "#89b4fa" : "#313244"

                        Text {
                            anchors.centerIn: parent
                            text: modelData.id
                            color: modelData.active ? "#1e1e2e" : "#cdd6f4"
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: modelData.activate()
                        }
                    }
                }
            }

            Clock {
                anchors {
                    centerIn: parent
                }
                time: Time.time
            }
        }
    }
}
