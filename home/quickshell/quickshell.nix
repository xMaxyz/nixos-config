{ config, pkgs, inputs, ... }:

{
  programs.quickshell = {
    enable = true;
    package = pkgs.quickshell;
  };

  xdg.configFile."quickshell/shell.qml".text = ''
    import QtQuick
    import Quickshell
    import "modules" as Module

    ShellRoot {
      Module.Wallpaper {}
      Module.MenuBar {}
      Module.Desktop {}
    }
  '';

  xdg.configFile."quickshell/qmldir".text = ''
    singleton Theme 1.0 Theme.qml
  '';

  xdg.configFile."quickshell/Theme.qml".text = ''
    pragma Singleton
    import QtQuick

    QtObject {
      //colors
      property color menubarBackground: "#${config.my.theme.custom.quickshell.menubar.background}" //background for components of menubar
      property color widgetBackground: "#${config.my.theme.custom.quickshell.widget.background}"
      property color widgetBorderColor: "#${config.my.theme.custom.quickshell.widget.border.color}"
      property color accent: "#${config.my.theme.custom.quickshell.accent}"
      property color foreground: "#${config.my.theme.custom.quickshell.text.color}" //text color
      property color widgetSubtext: "#${config.my.theme.custom.quickshell.widget.subtext}"

      //fonts
      readonly property string fontFamily: "${config.my.theme.custom.quickshell.text.family}"
      readonly property int normalFontSize: ${config.my.theme.custom.quickshell.text.size}

      //box style
      readonly property int borderRadius: ${config.my.theme.custom.quickshell.menubar.border.radius} //for all components of menubar but MusicPopup
      readonly property int menubarBoxWidth: ${config.my.theme.custom.quickshell.menubar.boxwidth} //Base value for all components of menubar
      readonly property int menubarBoxHeight: ${config.my.theme.custom.quickshell.menubar.boxheight} //Height for all menubar


      //Widget
      readonly property real widgetzoneWidth: ${config.my.theme.custom.quickshell.widget.zonewidth}
    }
  '';

  xdg.configFile = {
    "quickshell/modules/Wallpaper.qml".source = ../../assets/quickshell/modules/Wallpaper.qml;
    "quickshell/modules/MenuBar.qml".source = ../../assets/quickshell/modules/MenuBar.qml;
    "quickshell/modules/Desktop.qml".source = ../../assets/quickshell/modules/Desktop.qml;

    "quickshell/menubar/ClockBox.qml".source = ../../assets/quickshell/menubar/ClockBox.qml;
    "quickshell/menubar/MusicBox.qml".source = ../../assets/quickshell/menubar/MusicBox.qml;
    "quickshell/menubar/MusicPopup.qml".source = ../../assets/quickshell/menubar/MusicPopup.qml;
    "quickshell/menubar/StatusBar.qml".source = ../../assets/quickshell/menubar/StatusBar.qml;
    
    "quickshell/desktop/widgets/ClockWidget.qml".source = ../../assets/quickshell/desktop/widgets/ClockWidget.qml;
  };
}