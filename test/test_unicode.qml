import QtQuick 2.0

Rectangle {
    id     : root
    width  : 480
    height : 360
    color  : "beige"

    Grid{
        id      : _grid1
        columns : 3
        spacing : 10
        Repeater {
            id : _rep
            model : [ "\u2600", "\u2764", "\u2713",
            "\u2605", "\u2602", "\u265e",
            "\u2622", "\u260e", "\u221e",
            "\u2744", "\u266b", 
        ] 
        Text {
            text           : modelData
            font.pointSize : 32
        }
    }
} // grid1

}
