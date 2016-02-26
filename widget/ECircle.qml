import QtQuick 2.0

Rectangle {
    id      : root
    width   : 36
    height  : width
    radius  : width / 2
    color   : "tomato"

    property int color_duration : 300
    Behavior on color {
        ColorAnimation {
            duration : color_duration
        }
    }
}
