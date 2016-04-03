import QtQuick 2.0
import "../widget/"

Rectangle {
    id     : root

    width  : 480
    height : 360
    color  : "beige"

    HourSelect {
        id     : _selecter
        width  : 212
        height : 314
    }

    EButton {
        id   : _bt_get
        text : "Get Time"

        anchors {
            left       : _selecter.right
            leftMargin : 30
            top        : parent.top
            topMargin  : 50
        }
        onClicked : {
            var selected = _selecter.getTimePoint();
            print("\x1b[32m  selected time:: " + selected + "\x1b[0m");
        }
    }

}
