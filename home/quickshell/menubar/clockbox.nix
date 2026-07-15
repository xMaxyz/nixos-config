{ pkgs, config, ... }:

{
  xdg.configFile."quickshell/menubar/ClockBox.qml".text = ''
    import QtQuick
    import Quickshell
    import Quickshell.Hyprland

    Item {
      anchors.centerIn: parent

      Rectangle {
        anchors.centerIn: parent

        height: ${config.my.theme.custom.quickshell.menubar.boxheight}
        width: ${config.my.theme.custom.quickshell.menubar.boxwidth}
        radius: ${config.my.theme.custom.quickshell.menubar.border.radius}
        color: "#${config.my.theme.custom.quickshell.menubar.background}"

        Text {
          id: clockText
          color: "#${config.my.theme.custom.quickshell.text.color}"
          font.pointSize: ${config.my.theme.custom.quickshell.text.size}
          font.family: "${config.my.theme.custom.quickshell.text.family}"
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
  '';
}