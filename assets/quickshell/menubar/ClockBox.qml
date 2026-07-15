import QtQuick
import Quickshell
import Quickshell.Hyprland
import ".."

Item {
    anchors.centerIn: parent

    Rectangle {
        anchors.centerIn: parent

        height: Theme.menubarBoxHeight
        width: Theme.menubarBoxWidth
        radius: Theme.borderRadius
        color: Theme.menubarBackground

        Text {
            id: clockText
            color: Theme.foreground
            font.pointSize: Theme.normalFontSize
            font.family: Theme.fontFamily
            anchors.centerIn: parent
            text: Qt.formatTime(new Date(), "hh:mm")
        }
    }

    //clock updater
    Timer {
        interval: 1000
        repeat: true
        running: true

        onTriggered: {
            clockText.text = Qt.formatTime(new Date(), "hh:mm")
        }
    }
}