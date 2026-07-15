import QtQuick
import Quickshell
import Quickshell.Wayland
import "../menubar" as MenuBar
import ".."

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
    implicitHeight: Theme.menubarBoxHeight

    
    // ===== Background =====
    Rectangle {
        anchors.fill: parent
        color: "#00000000"

        // ===== Left Group =====
        Row {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            spacing: 10

            Item {
                id: checkForHyprland
                height: workspacebarLoader.height
                width: workspacebarLoader.width

                property bool isHyprland: Quickshell.env("XDG_CURRENT_DESKTOP") === "Hyprland"
                
                Loader {
                    id: workspacebarLoader
                    active: checkForHyprland.isHyprland
                    source: Qt.resolvedUrl(Quickshell.shellDir + "/menubar/WorkspaceBar.qml")
                    width: item ? item.implicitWidth : 0
                    height: item ? item.height : 0

                }
            }          
            MenuBar.MusicBox {}
        }

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
