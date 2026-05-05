import QtQuick
import Quickshell
import Quickshell.Io

Item {
    property alias cpuUsage: cpuProc.cpuUsage

    Process {
        id: cpuProc

        property int cpuUsage: 0
        property int lastCpuIdle: 0
        property int lastCpuTotal: 0

        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var p = data.trim().split(/\s+/)
                var idle = parseInt(p[4]) + parseInt(p[5])
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                if (cpuProc.lastCpuTotal > 0) {
                    cpuProc.cpuUsage = Math.round(100 * (1 - (idle - cpuProc.lastCpuIdle) / (total - cpuProc.lastCpuTotal)))
                }
                cpuProc.lastCpuTotal = total
                cpuProc.lastCpuIdle = idle
            }
        }
        Component.onCompleted: running = true
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: cpuProc.running = true
    }
}