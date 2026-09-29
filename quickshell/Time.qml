pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm:ss | ddd d MMM ");
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
    // Process {
    //     id: dateProc
    //     command: ["date", "+%H:%M:%S   %a %d %b"]
    //     running: true
    //
    //     stdout: StdioCollector {
    //         onStreamFinished: root.time = this.text
    //     }
    // }
    //
    // Timer {
    //     interval: 1000
    //     running: true
    //     repeat: true
    //     onTriggered: dateProc.running = true
    // }
}
