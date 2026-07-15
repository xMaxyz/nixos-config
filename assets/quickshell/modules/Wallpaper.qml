import Quickshell
import Quickshell.Wayland
import QtQuick
import ".."

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
            source: "file://" + Quickshell.env("HOME") + "/Bilder/.wallpaper/wallpaper"
            anchors.fill: parent
            
            // Verhindert Verzerrungen und füllt den Bildschirm sauber aus
            fillMode: Image.PreserveAspectCrop 
        }
    }
}
