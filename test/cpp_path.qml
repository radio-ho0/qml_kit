import ho0 1.0

import QtQuick 2.0
import "../widget"
import "../js/kit.js" as Kit

Rectangle {
    id     : root
    color  : Kit.color_bg
    width  : 800
    height : 600

    Grid {
        id           : grid
        columns      : 2
        spacing      : 5
        anchors.fill : parent

        ELabel {
            id             : lb_source
            width          : 120
            height         : 50
            text           : qsTr("source")
            font.pointSize : 16
        }

        Rectangle {
            id     : border_source
            width  : 670
            height : 340
            radius : 8
            color  : "lightgreen"
            TextEdit {
                id            : txt_source
                selectByMouse : true
                anchors {
                    fill    : parent
                    margins : 5
                }
                text           : ""
                font.pixelSize : 12
            }
        }

        ELabel {
            id             : lb_path
            width          : 120
            height         : 50
            text           : qsTr("Path")
            font.pointSize : 16
        }
        Rectangle {
            id     : path_border
            width  : 670
            height : 50
            color  : "yellowgreen"
            radius : 8

            TextInput {
                id     : txt_path
                width  : 580
                height : 50
                color  : "orangered"
                text   : ""

                font.pixelSize      : 22
                selectByMouse       : true
                horizontalAlignment : Text.AlignLeft
                verticalAlignment   : Text.AlignVCenter
                anchors {
                    left       : parent.left
                    leftMargin : 12
                }

                onAccepted:  {
                    parseText();
                }
            }

            EButton {
                id         : go
                width      : parent.width - txt_path.width - 5
                height     : parent.height
                color      : "orangered"
                text_color : "white"
                radius     : 8
                text       : "go!"
                anchors {
                    right : parent.right
                    left  : txt_path.right
                }
                onClicked:  {
                    parseText();
                }
            }
        } // path_border

        ELabel {
            id             : lb_output
            width          : 120
            height         : 50
            text           : qsTr("Output")
            font.pointSize : 16
        }

        Rectangle {
            id     : border_output
            width  : 670
            height : 170
            radius : 8
            color  : "tomato"
            //TextEdit {
            EScrollText  {
                id        : txt_output
                text      : ""
                anchors {
                    fill    : parent
                    margins : 5
                }
            }

        }

    } // grid

    JSONPath {
        id : my_json_path

        onGetVale: {
            txt_output.text  = str;
        }
    }

    function parseText(){
        print("\x1b[32m go! \x1b[0m");
        var txt =  txt_source.text ;
        var query = txt_path.text

        if( query !== "" ){
            var result = my_json_path.setJSON( txt, query.toString() );
            txt_output.text = result;
        }
    }
    

}
