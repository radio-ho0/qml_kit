
import QtQuick 2.0
import QtMultimedia 5.4

Rectangle {
    id     : root
    height : 15
    color  : "#39424d"

    property MediaPlayer mediaPlayer
    property var    bg_color   : "#e3c800"
    property var    text_color : "#fa6800"

    Rectangle {
        id    : _bg
        width : mediaPlayer.duration > 0 ? parent.width*mediaPlayer.position / mediaPlayer.duration : 0
        anchors {
            left   : parent.left
            top    : parent.top
            bottom : parent.bottom
        }
        color  : bg_color
    }

    MouseArea {
        id : _ma
        property int pos

        anchors.fill: parent

        onClicked: {
            if(mediaPlayer.seekable){
                pos = mediaPlayer.duration * mouse.x / width
            }
            mediaPlayer.seek(pos)
        }
    }

    Text {
        id     : curr_time
        width  : 90
        color  : text_color
        smooth : true
        text   : formatTime( mediaPlayer.position )

        horizontalAlignment : Text.AlignLeft
        verticalAlignment   : Text.AlignVCenter
        anchors { 
            left       : parent.left
            top        : parent.top
            bottom     : parent.bottom
            leftMargin : 10
        }
    }


    Text {
        id     : _end_time
        width  : 90
        color  : text_color
        smooth : true
        horizontalAlignment : Text.AlignRight
        verticalAlignment   : Text.AlignVCenter
        anchors { 
            right       : parent.right
            top         : parent.top
            bottom      : parent.bottom
            rightMargin : 10
        }
        text: formatTime( mediaPlayer.duration )
    }

    function formatTime(timeInMs) {
        if (!timeInMs || timeInMs <= 0) return "0:00"
        var seconds = timeInMs / 1000;
        var minutes = Math.floor(seconds / 60)
        seconds = Math.floor(seconds % 60)
        if (seconds < 10) seconds = "0" + seconds;
        return minutes + ":" + seconds
    }
}
