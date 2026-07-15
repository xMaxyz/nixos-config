{ pkgs, config, ... }:

{
  xdg.configFile."quickshell/modules/Wallpaper.qml".text = ''
    import Quickshell
    import Quickshell.Wayland
    import QtQuick

    ShellRoot {
      PanelWindow {
        id: wallpaperWindow
        
        //puts wallpaper in wayland layer "background"
        WlrLayershell.layer: WlrLayer.Background
        WlrLayershell.namespace: "wallpaper"
        //force wallpaper to reach into menubar's exclusive zone
        WlrLayershell.exclusionMode: WlrLayershell.Ignore
        
        //fills screen
        anchors {
          top: true
          bottom: true
          left: true
          right: true
        }

        Image {
          id: backgroundImage
          source: "${config.my.theme.global.wallpaper}"
          anchors.fill: parent
            
          // Verhindert Verzerrungen und füllt den Bildschirm sauber aus
          fillMode: Image.PreserveAspectCrop 
        }
      }
    }

  '';
}