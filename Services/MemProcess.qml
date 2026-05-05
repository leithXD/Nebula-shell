import QtQuick
import Quickshell
import Quickshell.Io

Item {
    property alias memUsage: memProc.memUsage

    Process {
        id: memProc

        property int memUsage: 0

        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                memUsage = Math.round(100 * used / total)
            }
        }
        Component.onCompleted: running = true
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            memProc.running = true
        }
    }
}