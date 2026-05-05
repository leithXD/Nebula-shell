import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import "Widgets"
import "../../Core"

PanelWindow {
    id: root

    //theming
    Theming { id: theme }

    property color colBg: theme.colBg
    property color colCyan: theme.colCyan
    property color colPink: theme.colPink
    property color colBlue: theme.colBlue
    property color colYellow: theme.colYellow
    property color colMuted: theme.colMuted
    property string fontFamily: theme.fontFamily
    property int fontSize: theme.fontSize
   
    
    //system data
    
    
    // cpu

    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: root.colBg

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 10

        Logo { }

        Workspaces { }

        Item { Layout.fillWidth: true }

        Clock { }

        Item { Layout.fillWidth: true }
        
        Systemvitals { }

        Powerbutton { }
    }
}