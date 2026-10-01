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
            property var hyprMonitor: Hyprland.monitorFor(screen)

            screen: bar.modelData

            anchors.top: true
            anchors.left: true
            anchors.right: true

            implicitHeight: 36

            color: Colors.bg

            RowLayout {
                anchors.leftMargin: 6
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                spacing: 6

                Repeater {
                    model: Hyprland.workspaces.values.filter(ws => ws.monitor === bar.hyprMonitor)

                    Rectangle {
                        width: 24
                        height: 24 * 2
                        radius: 4
                        required property var modelData
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

            ClockWidget {
                anchors.centerIn: parent
                time: Time.time
            }

            RowLayout {
                anchors.right: parent.right
                anchors.rightMargin: 6
                anchors.verticalCenter: parent.verticalCenter
                spacing: 6

                Column {
                    id: col
                    property int spacingInRow: 2
                    property int boxSize: 6
                    spacing: 4

                    Repeater {
                        model: 3
                        Rectangle {
                            color: "transparent"
                            implicitWidth: boxRow.implicitWidth
                            implicitHeight: boxRow.implicitHeight
                            Row {
                                id: boxRow
                                spacing: col.spacingInRow
                                Repeater {
                                    model: 6

                                    Rectangle {
                                        color: "blue"

                                        implicitWidth: col.boxSize * index
                                        implicitHeight: col.boxSize
                                    }
                                }
                            }
                        }
                    }
                }

                SystemTrayWidget {}

                PowerWidget {}
            }
        }
    }
}
