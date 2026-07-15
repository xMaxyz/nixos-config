{ pkgs, config, ... }:

{
  xdg.configFile."quickshell/menubar/MusicBox.qml".text = ''
    import QtQuick
    import Quickshell
    import Quickshell.Io

    Rectangle {
      id: mediaBox

      property string currentTrack: "-"

      width: Math.max(${config.my.theme.custom.quickshell.menubar.boxwidth}, mediaText.implicitWidth + 20)
      height: ${config.my.theme.custom.quickshell.menubar.boxheight}
      radius: ${config.my.theme.custom.quickshell.menubar.border.radius}
      clip: true
      color: ${config.my.theme.custom.quickshell.menubar.background}

      //Timer for bridge between MusicBox and popup
      Timer {
        id: closeTimer
        interval: 150
        running: false
        repeat: false
        onTriggered: {
          if (!musicPopup.mouseInPopup) {
            musicPopup.visible = false
          }
        }
      }

      //hover detection
      MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
          closeTimer.stop()
          musicPopup.anchor.item = mediaBox
          musicPopup.anchor.updateAnchor()
          musicPopup.visible = true
        }
        
        onExited: {
          closeTimer.start()
        }
      }

      //timer for fetching urrent track
      Timer {
        id: mediaTimer
        interval: 2000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: playerProcess.running = true
      }

      //process for fetching track
      Process {
        id: playerProcess
        command: ["playerctl", "metadata", "--format", "{{artist}} - {{title}}|{{mpris:artUrl}}"]
        running: false

        stdout: StdioCollector {
          onStreamFinished: {
            let output = this.text.trim();
                        
            if (output.length > 0 && output !== "-") {
              let parts = output.split("|");
              let track = parts[0].trim();

              mediaBox.currentTrack = track;
              mediaBox.width = Math.max(70, mediaText.implicitWidth + 24);
            } else {
              mediaBox.currentTrack = "-";                            
              mediaBox.width = 0;
            }
          }
        }

        //dump stderr if no music player is running
        stderr: StdioCollector {
          onStreamFinished: {
            if (this.text.trim().length > 0) {
              mediaBox.currentTrack = "-";
            }
          }
        }
      }

      Text {
        id: mediaText
        anchors.centerIn: parent
        width: parent.width - 24
        elide: Text.ElideRight
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: ${config.my.theme.custom.quickshell.text.size}
        font.family: ${config.my.theme.custom.quickshell.text.family}
        color: "#${config.my.theme.custom.quickshell.text.color}"
        text: mediaBox.currentTrack
      }
    }

  '';
}