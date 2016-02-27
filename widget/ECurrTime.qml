import QtQuick 2.0

// :from:  https://github.com/DynamicPerception/Graffik/blob/master/ui/MainMenu.qml
Column {
    id : root

    property alias color_time : time_core.color
    property alias color_tip  : time_tip.color
    property alias timeout    : update_timer.interval
    spacing : 3

    Text {
        id                       : time_core
        anchors.horizontalCenter : parent.horizontalCenter
        font.family              : "Arial"
        font.pixelSize           : 16
        renderType               : Text.NativeRendering
        color                    : "orangered"
        text                     : "00:00:00"

        Timer {
            id               : update_timer
            running          : true
            interval         : 1000
            repeat           : true
            triggeredOnStart : true

            onTriggered: {
                var d = new Date()
                var h = d.getHours()
                var m = d.getMinutes()
                var s = d.getSeconds()

                h = h < 10 ? "0" + h : h
                m = m < 10 ? "0" + m : m
                s = s < 10 ? "0" + s : s
                parent.text = h + ":" + m + ":" + s
            }
        }
    }

    Text {
        id             : time_tip
        font.family    : "Arial"
        font.pixelSize : 13
        renderType     : Text.NativeRendering
        color          : "#808080"
        text           : qsTr("Current Time")

        anchors.horizontalCenter : parent.horizontalCenter
    }
}

