import QtQuick 2.2
import QtQuick.Controls.Styles 1.2

ProgressBarStyle {
    id  : root

    property var bg_color          : ""
    property var bg_broder_color   : ""
    property var bg_img            : ""

    property var fill_color        : ""
    property var fill_border_color : ""
    property var fill_img          : ""

    function selectWhich(value, default_value){
        return value.length > 0 ? value : default_value;
    }

    background: Rectangle {
        id             : _bg
        radius         : 2
        color          : selectWhich(bg_color, "lightgray");
        border.color   : selectWhich(bg_broder_color, color);
        border.width   : 1
        implicitWidth  : 200
        implicitHeight : 24

        Image {
            id           : _bg_img
            anchors.fill : parent
            source       : selectWhich(bg_img, "");
        }

    }
    progress: Rectangle {
        id           : _progress
        color        : selectWhich(fill_color, "lightsteelblue");
        border.color : selectWhich(fill_border_color, color);

        Image {
            id           : _progress_img
            anchors.fill : parent
            source       : selectWhich( fill_img, "");
        }
    }

}
