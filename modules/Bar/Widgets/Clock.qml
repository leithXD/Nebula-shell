import QtQuick
import "../../../Core"

Text {
    id: clock
    anchors.verticalCenter: parent.verticalCenter
    text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")

    Theming {
        id: theme
    }

    color: theme.colPink
    font {
        family: theme.fontFamily
        pixelSize: theme.fontSize
        bold: true
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    }
}
