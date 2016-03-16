import QtQuick 2.0

Rectangle {
    id     : root
    color  : "transparent"
    width  : 360
    height : 240

    property alias text: helpText.text

    Rectangle {
        id     : helpScreen
        width  : root.width
        height : root.height
        color  : "transparent"

        Flickable {
            id                 : flick1
            anchors.fill       : parent
            contentWidth       : helpText.width
            contentHeight      : helpText.height
            flickableDirection : Flickable.VerticalFlick
            clip               : true


            TextEdit{
                id             : helpText
                wrapMode       : TextEdit.Wrap
                width          : helpScreen.width - 10;
                readOnly       : true
                font.pointSize : 16
                selectByMouse  :  true
                font.family    : "wqy-zenhei"
                font.weight    : Font.DemiBold
                color          : "white"
                text           : text
            }

        }
        ScrollBar {
            id            : bar
            scrollArea    : flick1
            height        : flick1.height
            width         : 6
            anchors.right : helpScreen.right
        }
    }
}
