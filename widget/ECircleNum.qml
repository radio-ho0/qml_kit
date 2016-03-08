import QtQuick 2.0

ECircle {
    id    : root
    width : _cir1.width + 4
    color : "black"

    property alias num    : _text.text
    property alias font   : _text.font
    property var   margin : 4

    Component.onCompleted : {
        _cir1.width  = _text.paintedWidth + margin;
        root.width   = _cir1.width + margin;
    }

    ECircle {
        id    : _cir1
        width : ( _text.paintedWidth) + 4
        color : "white"

        anchors {
            horizontalCenter : parent.horizontalCenter
            verticalCenter   : parent.verticalCenter
        }

        ELabel {
            id   : _text
            text : "42"

            anchors {
                horizontalCenter : parent.horizontalCenter
                verticalCenter   : parent.verticalCenter
            }
        }
    }
}
