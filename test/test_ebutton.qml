import QtQuick 2.0
import "../widget"

Rectangle {
    id     : root
    width  : parent.width
    height : parent.height
    
    color : "beige"
    
    Column {
        id               : col
        width            : parent.width
        height           : parent.height
        anchors.centerIn : parent
        spacing          : 30
        EButton {
            id           : bt1
            width        : 140
            height       : 40
            source       : "../pics/bt1.png"
            source_press : "../pics/bt2.png"
        }
        
        EButton {
            id           : bt2
            width        : 140
            height       : 40
            text         : "this    bt2"
            text_color   : "yellow"
            source       : "../pics/bt1.png"
            source_press : "../pics/bt2.png"
        }
        
        EButton {
            id     : bt3
            width  : 120
            height : 50
            color  : "orange"
            source : ""
            radius : 8

        }
    }
}

