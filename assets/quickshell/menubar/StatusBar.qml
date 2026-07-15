import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Services.UPower
import Quickshell.Io
import Quickshell.Networking
import ".."

Row {
    id: root
    spacing: 10

    //Volume
    Rectangle {
        id: volumeBox

        PwObjectTracker { //Tracker for audio
            objects: [Pipewire.defaultAudioSink]
        }

        //check if there's a sink
        property bool hasAudio: Pipewire.defaultAudioSink?.audio ?? false
        //get raw volume
        property real volumeRaw: hasAudio ? Pipewire.defaultAudioSink.audio.volume : 0.0
        //calculate real volume
        property int volumePercent: Math.round(volumeRaw * 100)
        //check whether default sink is muted
        property bool isMuted: Pipewire.defaultAudioSink?.audio?.muted ?? false

        width: Theme.menubarBoxWidth
        height: Theme.menubarBoxHeight
        radius: Theme.borderRadius
        color: Theme.menubarBackground

        Text {
            anchors.centerIn: parent
            font.pointSize: Theme.normalFontSize
            font.family: Theme.fontFamily
            color: volumeBox.isMuted ? Theme.accent : Theme.foreground
            text: volumeBox.hasAudio ? "V: " + volumeBox.volumePercent + "%" : "V: -"
        }
    }

    //Battery
    Rectangle {
        id: batteryBox

        //Tracker for battery
        PwObjectTracker {
            objects: [UPower.displayDevice]
        }

        //check for battery
        readonly property bool hasBattery: UPower.displayDevice !== null
        //calculate percentage
        readonly property int batteryPercent: hasBattery ? Math.round(UPower.displayDevice.percentage * 100) : 0
        
        width: Theme.menubarBoxWidth
        height: Theme.menubarBoxHeight
        radius: Theme.borderRadius
        color: Theme.menubarBackground

        Text {
            anchors.centerIn: parent
            font.pointSize: Theme.normalFontSize
            font.family: Theme.fontFamily
            color: (batteryBox.batteryPercent < 50) ? Theme.accent : Theme.foreground
            text: batteryBox.hasBattery ? "B: " + batteryBox.batteryPercent + "%" : "B:  -"
        }
    }

    //Memory
    Rectangle {
        id: memoryBox

        property string ramUsage: "0.0 GB"

        width: Math.max(Theme.menubarBoxWidth, memoryText.implicitWidth + 20)
        height: Theme.menubarBoxHeight
        radius: Theme.borderRadius
        color: Theme.menubarBackground

        //Timer for triggering command
        Timer {
            id: ramTimer
            interval: 5000
            running: true
            repeat: true
            triggeredOnStart: true
            onTriggered: ramProcess.running = true
        }

        //Get RAM usage
        Process {
            id: ramProcess
            command: ["free", "-m"] //command to get ram
            running: false

            stdout: StdioCollector {
                onStreamFinished: {
                    let output = this.text;
                    let lines = output.split("\n");

                    if (lines.length > 1) {
                        let memLine = lines[1].replace(/\s+/g, ' ').trim().split(' ');
                        let usedMB = parseInt(memLine[2]);

                        if (!isNaN(usedMB)) {
                            let usedGB = (usedMB / 1024).toFixed(1);
                            memoryBox.ramUsage = usedGB + "GiB";
                        }
                    }
                }
            }
        }

        Text {
            id: memoryText
            anchors.centerIn: parent
            font.pointSize: Theme.normalFontSize
            font.family: Theme.fontFamily
            color: Theme.foreground
            text: "M: " + memoryBox.ramUsage
        }
    }

    //Wifi
    Rectangle {
        id: wifiBox

        property string wifiName: "-"

        width: Math.max(Theme.menubarBoxWidth, wifiText.implicitWidth + 20)
        height: Theme.menubarBoxHeight
        radius: Theme.borderRadius
        color: Theme.menubarBackground
        Behavior on width {
            NumberAnimation { duration: 300; easing.type: Easing.InOutQuad }
        }

        Timer {
            id: wifiTimer
            interval: 5000
            running: true
            repeat: true
            triggeredOnStart: true
            onTriggered: wifiProcess.running = true
        }

        Process {
            id: wifiProcess
            command: ["iwgetid", "-r"]
            running: false

            stdout: StdioCollector {
                onStreamFinished: {
                    let name = this.text.trim();

                    if (name.length > 0) {
                        wifiBox.wifiName = name;
                    } else {
                        wifiBox.wifiName = "-";
                    }
                }
            }
        }
        Text {
            id: wifiText
            anchors.centerIn: parent
            font.pointSize: Theme.normalFontSize
            font.family: Theme.fontFamily
            color: Theme.foreground
            text: "W: " + wifiBox.wifiName
        }
    }
} 