import QtQuick 2.0
import "../js/kit.js" as Kit

Rectangle {
    id     : root
    width  : 580
    height : 50
    color  : "transparent"

    property alias source      : weather_icon.source
    property alias date        : info_date.text
    property alias description : info_description.text
    property alias humidity    : info_humidity.text
    property alias temperature : info_temperature.text

    Image {
        id                     : weather_icon
        width                  : 48
        height                 : 48
        anchors.verticalCenter : parent.verticalCenter
        source                 : "../pics/weather/weather-clear.png"
    }
    Text {
        id                     : info_date
        text                   : "2015-01-10 15:00:00"
        color               : Kit.color_date
        font.pointSize         : 15
        anchors.verticalCenter : parent.verticalCenter
        anchors{
            left               : weather_icon.right
            leftMargin         : 10
        }
    }
    Text {
        id                     : info_description
        text                   : "Sunny"
        font.pointSize         : 22
        anchors.verticalCenter : parent.verticalCenter
        anchors{
            left               : info_date.right
            leftMargin         : 10
        }
        width : Math.max(contentWidth, 200)
    }
    Text {
        id                     : info_temperature
        text                   : "23"
        font.pointSize         : 22
        color :     Kit.color_temperature
        anchors.verticalCenter : parent.verticalCenter
        anchors{
            left               : info_description.right
            leftMargin         : 10
        }
    }
    Text {
        id                     : info_humidity
        text                   : "60"
        font.pointSize         : 22
        anchors.verticalCenter : parent.verticalCenter
        anchors{
            left               : info_temperature.right
            leftMargin         : 10
        }
    }


}


