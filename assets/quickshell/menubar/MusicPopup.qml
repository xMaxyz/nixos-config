import QtQuick
import Quickshell
import Quickshell.Io
import ".."

PopupWindow {
    id: popupWindow

    property bool mouseInPopup: false

    anchor {
        edges: Edges.Bottom | Edges.Left
    }

    visible: false
    implicitWidth: 250
    implicitHeight: 120
    color: "transparent"

    //main background
    Rectangle {
        anchors.fill: parent
        radius: Theme.borderRadius
        color: "#F2141414"
        border.color: "#33ffffff"
        border.width: 1

        //hover detection
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                popupWindow.mouseInPopup = true
            }

            onExited: {
                popupWindow.mouseInPopup = false
                popupCloseTimer.start()
            }
        }

        //layout for content
        Row {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 12

            //cover placeholder
            Rectangle {
                width: 96
                height: 96
                radius: 6
                color: "#33ffffff"
                Text {
                    anchors.centerIn: parent
                    text: "🎵"
                    font.pointSize: 24
                }
            }


            // Controls
            Column {
                width: parent.width - 108; height: parent.height; spacing: 8

                Text { text: "Musik-Steuerung"; color: Theme.foreground; font.bold: true; font.pointSize: 10 }

                Row {
                    spacing: 16
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text { text: "⏮"; color: Theme.foreground; font.pointSize: 14; MouseArea { anchors.fill: parent; onClicked: prevProcess.running = true } }
                    Text { text: "⏯"; color: Theme.foreground; font.pointSize: 14; MouseArea { anchors.fill: parent; onClicked: toggleProcess.running = true } }
                    Text { text: "⏭"; color: Theme.foreground; font.pointSize: 14; MouseArea { anchors.fill: parent; onClicked: nextProcess.running = true } }
                }
            }
        }

        //Timer for closing popup
        Timer {
            id: popupCloseTimer
            interval: 100
            running: false
            repeat: false
            onTriggered: {
                if (!popupWindow.mouseInPopup) {
                    popupWindow.visible = false
                }
            }
        }
    }

    //background processes
    Process { id: prevProcess; command: ["playerctl", "previous"]; running: false }
    Process { id: toggleProcess; command: ["playerctl", "play-pause"]; running: false }
    Process { id: nextProcess; command: ["playerctl", "next"]; running: false }
}
