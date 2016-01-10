import QtQuick 2.0

Rectangle {
    id : root
    width : 350
    height :50
    color : "transparent"

    property alias source  : weather_icon.source
    property alias date    : info_date.text
    property alias description : info_description.text

    Image {
        id : weather_icon
        width : 48
        height : 48
        anchors.verticalCenter: parent.verticalCenter
        source : "../pics/weather/weather-clear.png"
    }
    Text {
        id : info_date
        text: "2015-01-10 15:00:00"
        font.pointSize: 15
        anchors.verticalCenter: parent.verticalCenter
        anchors{
            left : weather_icon.right
            leftMargin:  10
        }
    }
    Text {
        id : info_description
        text: "Sunny"
        font.pointSize: 22
        anchors.verticalCenter: parent.verticalCenter
        anchors{
            left : info_date.right
            leftMargin:  10
        }
    }
}


