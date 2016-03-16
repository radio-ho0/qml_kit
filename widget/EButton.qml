import QtQuick 2.0

Rectangle {
    id                    : root
    property alias text   : label.text 
    property alias font   : label.font
    property alias source : img.source
    property alias text_color : label.color
    property string source_press 
    property string source_relea

    signal clicked
    signal pressed
    signal released

    width  : 120
    height : 50
    color  : "transparent"
    Image{
        id           : img
        anchors.fill : parent
        source       : ""
    }
    state:  "state_normal"
    MouseArea {
        id           : m_mouseArea
        anchors.fill : parent
        onClicked    : {
            root.clicked()
            parent.state = "state_normal"
        }
        onPressed:
        {
            root.pressed()
            parent.state = "state_pressed"
        }
        onReleased:
        {
            root.released()
            parent.state = "state_press"
        }
    }
    ELabel {
        id : label
        anchors.fill : parent
    }

    states: [
        State {
            name: "state_pressed"; 
            PropertyChanges { target: img; source: source_press ? source_press : source }
        },
        State {
            name: "state_normal"; 
            PropertyChanges { target: img; source: source }
        },
        State {
            name: "state_release"; 
            PropertyChanges { target: img; source: source_relea ? source_relea : source }
        }
    ]
}
