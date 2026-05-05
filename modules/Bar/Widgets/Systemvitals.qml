import QtQuick
import QtQuick.Layouts

import "../../../Core"
import "../../../Services"

RowLayout {
    spacing: 8
    anchors.verticalCenter: parent.verticalCenter

    Theming {
        id: theme
    }

    CpuProcess {
        id: cpu
    }

    MemProcess {
        id: mem
    }

    Text {
        text: "CPU: " + cpu.cpuUsage + "%"
        color: theme.colYellow
        font {
            family: theme.fontFamily
            pixelSize: theme.fontSize
            bold: true
        }
    }

    Rectangle {
        width: 1
        height: 16
        color: theme.colMuted
    }

    Text {
        text: "Mem: " + mem.memUsage + "%"
        color: theme.colCyan
        font {
            family: theme.fontFamily
            pixelSize: theme.fontSize
            bold: true
        }
    }

    Rectangle {
        width: 1
        height: 16
        color: theme.colMuted
    }
}
