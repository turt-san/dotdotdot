pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property alias bg: adapter.bg
    property alias accent: adapter.accent
    property alias text: adapter.text

    FileView {
        path: Quickshell.shellPath("colors.json")
        watchChanges: true
        onFileChanged: reload()

        JsonAdapter {
            id: adapter

            property color bg
            property color accent
            property color text
        }
    }
}
