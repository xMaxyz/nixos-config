{ pkgs, config, ... }:

{
  xdg.configFile."quickshell/menubar/StatusBar.qml".text = ''
    import QtQuick
    import Quickshell
    import Quickshell.Services.Pipewire
    import Quickshell.Services.UPower
    import Quickshell.Io
    import Quickshell.Networking

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

        width: ${config.my.theme.custom.quickshell.menubar.boxwidth}
        height: ${config.my.theme.custom.quickshell.menubar.boxheight}
        radius: ${config.my.theme.custom.quickshell.menubar.border.radius}
        color: "#${config.my.theme.custom.quickshell.menubar.background}"

        Text {
          anchors.centerIn: parent
          font.pointSize: ${config.my.theme.custom.quickshell.text.size}
          font.family: "${config.my.theme.custom.quickshell.text.family}"
          color: volumeBox.isMuted ? Theme.accent : "#${config.my.theme.custom.quickshell.text.color}"
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
        
        width: ${config.my.theme.custom.quickshell.menubar.boxwidth}
        height: ${config.my.theme.custom.quickshell.menubar.boxheight}
        radius: ${config.my.theme.custom.quickshell.menubar.border.radius}
        color: "#${config.my.theme.custom.quickshell.menubar.background}"

        Text {
          anchors.centerIn: parent
          font.pointSize: ${config.my.theme.custom.quickshell.text.size}
          font.family: "${config.my.theme.custom.quickshell.text.family}"
          color: (batteryBox.batteryPercent < 50) ? "#${config.my.theme.custom.quickshell.accent}" : "#${config.my.theme.custom.quickshell.text.color}"
          text: batteryBox.hasBattery ? "B: " + batteryBox.batteryPercent + "%" : "B:  -"
        }
      }

      //Memory
      Rectangle {
        id: memoryBox

        property string ramUsage: "0.0 GB"

        width: Math.max(${config.my.theme.custom.quickshell.menubar.boxwidth}, memoryText.implicitWidth + 20)
        height: ${config.my.theme.custom.quickshell.menubar.boxheight}
        radius: ${config.my.theme.custom.quickshell.menubar.border.radius}
        color: "#${config.my.theme.custom.quickshell.menubar.background}"

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
          font.pointSize: ${config.my.theme.custom.quickshell.text.size}
          font.family: "${config.my.theme.custom.quickshell.text.family}"
          color: "#${config.my.theme.custom.quickshell.text.color}"
          text: "M: " + memoryBox.ramUsage
        }
      }

      //Wifi
      Rectangle {
        id: wifiBox

        property string wifiName: "-"

        width: Math.max(${config.my.theme.custom.quickshell.menubar.boxwidth}, wifiText.implicitWidth + 20)
        height: ${config.my.theme.custom.quickshell.menubar.boxheight}
        radius: ${config.my.theme.custom.quickshell.menubar.border.radius}
        color: "#${config.my.theme.custom.quickshell.menubar.background}"
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
          font.pointSize: ${config.my.theme.custom.quickshell.text.size}
          font.family: "${config.my.theme.custom.quickshell.text.family}"
          color: "#${config.my.theme.custom.quickshell.text.color}"
          text: "W: " + wifiBox.wifiName
        }
      }
    } 
  '';
}