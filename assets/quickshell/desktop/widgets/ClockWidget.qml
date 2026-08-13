import QtQuick
import QtQuick.Layouts
import "../.."

Rectangle {
    id: clockWidget
    
    //width equals assigned widget zone width
    Layout.fillWidth: true
    Layout.preferredHeight: Theme.widgetClockBoxHeight
    
    color: Theme.widgetClockBoxBackground
    radius: Theme.widgetClockBorderRadius
    border.color: Theme.widgetClockBorderColor
    border.width: Theme.widgetClockBorderWidth

    //Timer to update time every second
    Timer {
        id: clockTimer
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            var currentDate = new Date();
            timeText.text = Qt.formatTime(currentDate, "hh:mm:ss");
            dateText.text = Qt.formatDate(currentDate, "dddd, d. MMMM yyyy");
        }
    }

    //arrange time and date on top of each other
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 5

        //time
        Text {
            id: timeText
            Layout.alignment: Qt.AlignHCenter
            color: Theme.widgetClockTexTopColor
            font.pointSize: Theme.widgetClockTextTopSize
            font.weight: Font.Bold
            font.family: Theme.fontFamily
            renderType: Text.NativeRendering
        }

        //date
        Text {
            id: dateText
            Layout.alignment: Qt.AlignHCenter
            color: Theme.widgetClockTextSubColor //slightly darker than normal text
            font.pointSize: Theme.widgetClockTextSubSize
            font.weight: Font.Normal
            font.family: Theme.fontFamily
            renderType: Text.NativeRendering
        }
    }
}
