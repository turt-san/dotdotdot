import QtQuick
import Quickshell.Services.UPower

Text {
    id: root

    visible: UPower.displayDevice.state !== 0

    font.bold: true
    font.pixelSize: 20

    text: Math.round(UPower.displayDevice.percentage * 100) + "%"
    color: UPower.displayDevice.state == 1 ? "#66FF00" : "red"
}
