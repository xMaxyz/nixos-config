{ pkgs, config, ... }: 

{
  xdg.configFile."quickshell/modules/Desktop.qml".text = ''
    import QtQuick
    import QtQuick.Layouts
    import Quickshell
    import Quickshell.Wayland
    import "../desktop/widgets" as Widget

    PanelWindow {
      aboveWindows: false //prevents desktop to lay above windows
      WlrLayershell.layer: WlrLayer.Background //puts desktop in background
      WlrLayershell.namespace: "desktop_widgets" //namespace for layering
      color: "transparent"

      //fills entire screen
      anchors {
        top: true
        bottom: true
        left: true
        right: true
      }

      RowLayout { //left/right separation
        anchors.fill: parent
        anchors.margins: 20
        spacing: 30

        //left side: widget container
        ColumnLayout {
          id: widgetZone
          Layout.preferredWidth: 350// Perfekte Breite für Widgets wie Uhr, Kalender, Medien
          Layout.minimumWidth: 0
          Layout.maximumWidth: 350
          Layout.fillHeight: true
          spacing: 15

          //Widget Components
          Widget.ClockWidget {}
            
          //Filler so widgets get sorted to the top
          Item {
            Layout.fillHeight: true
          }
        }

        //right side: icons
        Item {
          Layout.fillWidth: true
          Layout.fillHeight: true
        }
      }
    }

  '';
}