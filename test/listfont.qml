import QtQuick 2.0
import "../widget"
Rectangle {
    width  : 480
    height : 640
    color  : "beige"

    ListView {
	id           : font_list
        anchors.fill : parent
	model        : Qt.fontFamilies()

        delegate: Item {
            height : 40
	    width  : ListView.view.width

            Text {
                text             : modelData
		color            : "tomato"
		font.family      : modelData
		font.pixelSize   : 24
                anchors.centerIn : parent
            }
        }
    }

    ScrollBar {
        id         : font_list_bar
        width      : 8
        scrollArea : font_list
        
        anchors {
	    right  : font_list.right
	    top    : font_list.top
	    bottom : font_list.bottom
        }      
    }


}
