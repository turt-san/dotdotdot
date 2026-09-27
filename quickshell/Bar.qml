import Quickshell
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData

            screen: modelData

            implicitHeight: 30

            anchors {
                top: true
                left: true
                right: true
            }

            Rectangle {
                implicitHeight: 20
                implicitWidth: 20
                color: "red"
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
