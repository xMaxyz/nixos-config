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
        radius: Theme.menubarBoxRadius
        color: Theme.menubarBoxBackground

        Text {
            id: clockText
            color: Theme.menubarTextColor
            font.pointSize: Theme.menubarTextSize
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