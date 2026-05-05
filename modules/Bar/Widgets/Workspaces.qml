import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import "../../../Core"

RowLayout {
    id: root

    Theming {
        id: theme
    }

    property color colCyan: theme.colCyan
    property color colPink: theme.colPink
    property color colMuted: theme.colMuted
    property int fontSize: theme.fontSize

    anchors.verticalCenter: parent.verticalCenter

    spacing: 10

    Repeater {
        model: 9

        Text {
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

            text: index + 1
            color: isActive ? root.colCyan : (ws ? root.colPink : root.colMuted)
            font {
                pixelSize: root.fontSize
                bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + (index + 1))
            }
        }
    }
}
