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

    background: Canvas {
        id : canvas 
        width :20 
        height : 20 

        onPaint : {
            var ctx = canvas.getContext('2d');
            ctx.fillStyle = "rgb(200,0,0)";
            ctx.fillRect (00, 00, 55, 50);

            ctx.fillStyle = "rgba(0, 0, 200, 0.5)";
            ctx.fillRect (30, 30, 55, 50);
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
