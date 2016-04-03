import QtQuick 2.0

Rectangle {
    id :  root
    width : 100
    height : 80
    color : "transparent"

    property alias num : _txt.text

    Text {
        id : _txt
        anchors.fill : parent
        text : "aha!"
        font.pointSize: 18
        font.family: "DejaVu Sans"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
