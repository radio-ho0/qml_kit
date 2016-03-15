import QtQuick 2.0
import "../widget"

Rectangle {
	id     : root
	width  : parent.width
	height : parent.height
	color  : "beige"

    EGallery {
        id          : _gallery
        width       : 480
        height      : 360
        img_width   : 300
        img_height  : 220
        nav_margin  : 10
        frame_color : "gold"
        color       : "tomato"
        pic_prefix  : "../pics/"

    }
    Component.onCompleted : {
        _gallery.setArray( ["1.png", "2.png", "3.png"] );
    }

    Row {
        id : row
        RoundImage {
            id     : _img1
            source : "../pics/1.png"
            width  : 150
            height : 150
        }

        RoundImage2 {
            id     : _img2
            source : "../pics/2.png"
            width  : 150
            height : 150
        }

        anchors {
            top   : parent.top
            right : parent.right
        }
    }

}

