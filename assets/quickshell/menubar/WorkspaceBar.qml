import QtQuick
import Quickshell.Hyprland
import ".."

Rectangle {
    id: workspacebar

    //Variablen
    property int active: Hyprland.focusedWorkspace?.id ?? 1
    property int horizontalPadding: 24

    //Aussehen der Hintergrund-Box
    height: Theme.menubarBoxHeight
    radius: Theme.menubarBoxRadius
    implicitWidth: rowWorkspaces.width + (workspacebar.horizontalPadding * 2)
    color: Theme.menubarBoxBackground

    //Elemente
    Row {
        id: rowWorkspaces
        anchors.centerIn: parent
        spacing: 30

        Repeater {
            model: Hyprland.workspaces

            delegate: Text {
                //allg. Aussehen
                text: modelData.id
                font.pointSize: Theme.menubarTextSize
                opacity: 1.0
                visible: modelData.id > 0
                
                //Textfarbe nach aktivem Workspace
                color: modelData.id === workspacebar.active
                    ? Theme.accent
                    : Theme.foreground

                //Animation
                Behavior on color {
                    ColorAnimation {
                        duration: 300 //in ms
                        easing.type: Easing.OutCubic // Macht den Start schnell und das Ende sanft
                    }
                }
            }
        }
    }
}
