import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.UPower

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData

            screen: bar.modelData

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

            Clock {
                anchors {
                    centerIn: parent
                }
                time: Time.time
            }

            RowLayout {
                anchors {
                    right: power.left
                    rightMargin: 10
                    verticalCenter: parent.verticalCenter
                }

                spacing: 5

                Repeater {
                    model: SystemTray.items

                    Item {
                        id: trayItem
                        required property SystemTrayItem modelData

                        implicitWidth: 24
                        implicitHeight: 24

                        property bool isHovered: mouseArea.containsMouse

                        Rectangle {
                            anchors.fill: parent
                            radius: 6
                            // Replicates the responsive backdrop typical of Caelestia modules
                            color: parent.isHovered ? "rgba(0, 0, 0, 0.6)" : "red"
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
                            source: modelData.icon
                        }

                        MouseArea {
                            id: mouseArea
                            hoverEnabled: true
                            anchors.fill: parent
                            acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton

                            onClicked: mouse => {
                                if (mouse.button === Qt.RightButton) {
                                    if (trayItem.modelData.hasMenu) {
                                        anchor.open();
                                    }
                                } else {
                                    trayItem.modelData.activate();
                                }
                            }

                            QsMenuAnchor {
                                id: anchor
                                anchor {
                                    item: trayItem
                                }
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

            Text {
                id: power
                visible: UPower.displayDevice.state !== 0

                anchors {
                    right: parent.right
                    rightMargin: 6
                    verticalCenter: parent.verticalCenter
                }

                text: Math.round(UPower.displayDevice.percentage * 100) + "%" + UPower.displayDevice.state
                color: UPower.displayDevice.state == 1 ? "green" : "red"
            }
        }
    }
}
