{ pkgs, config, ... }:

{
  xdg.configFile."quickshell/modules/MenuBar.qml".text = ''
    import QtQuick
    import Quickshell
    import Quickshell.Wayland
    import "../menubar" as MenuBar

    ShellRoot {
      PanelWindow {
        anchors {
          top: true
          left: true
          right: true
        }
    
        //puts menubar in Wayland layer "top"
        WlrLayershell.layer: WlrLayer.Top
        WlrLayershell.namespace: "menubar"


        color: "transparent"
        implicitHeight: ${config.my.theme.custom.quickshell.menubar.boxheight}

    
        // ===== Background =====
        Rectangle {
          anchors.fill: parent
          color: "#00000000"

          // ===== Clock =====
          MenuBar.ClockBox {}

          // ===== Right Group =====
          MenuBar.StatusBar {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
          }
        }

        //music popup
        MenuBar.MusicPopup {
          id: musicPopup
        }
      }
    }
  '';
}