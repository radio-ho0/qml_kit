import QtQuick 2.0

Rectangle {
    id     : root
    width  : parent.width
    height : parent.height
    color  : "transparent"

    property alias info : txt.text
    property var   show : function(text){
        info = text;
        root.visible = true;
        enter_ani.start();
    }

    property var hide : function() {
        hide_ani.start();
    }

    signal accepted();
    signal canceled();

    signal finished();

    Component.onCompleted:  {

    }

    Rectangle {
        id           : bg_fill
        color        : "black"
        opacity      : 0.8
        anchors.fill : parent
        MouseArea {
            id           : ma_empty
            anchors.fill :  parent

            onClicked: {
                hide_ani.start();
            }
        }
    }

    Rectangle {
        id               : msg_frame
        width            : 550
        height           : 336
        color            : "#494949"
        radius           : 8
        anchors.centerIn : parent

        MouseArea {
            id : frame_empty_ma
            anchors.fill:  parent
        }

        Rectangle {
            id              : msg_bg
            anchors.fill    : parent
            anchors.margins : 10
            color           : "#2b2b2b"
            radius          : 8

            EButton {
                id     : bt_close
                width  : 50
                height : width
                source : "../pics/close.png"
                font.pointSize:  16
                onClicked: {
                    hide();
                }
                anchors {
                    top         : parent.top
                    topMargin   : 15
                    right       : parent.right
                    rightMargin : 15
                }
            } // bt_close

            Text {
                id             : txt
                text           : "hello world!"
                font.family    : "Microsoft New Tai Lue"
                font.pointSize : 24
                color          : "#feffff"
                anchors {
                    top              : parent.top
                    topMargin        : 115
                    horizontalCenter : parent.horizontalCenter
                }

            }

            EButton {
                id     : bt_accept
                width  : 200
                height : 60
                text   : qsTr("Accept")
                text_color : "white"
                color  : "#77a737"
                source : ""
                radius : 8
                anchors {
                    top        : parent.top
                    topMargin  : 220
                    left       : parent.left
                    leftMargin : 25
                }
                onClicked:  {
                    hide();
                    root.accepted();
                }
            }
            EButton {
                id         : bt_cancel
                width      : 200
                height     : 60
                text       : qsTr("Cancel")
                color      : "#ee554d"
                text_color : "white"
                radius     : 8
                source     : ""
                anchors {
                    top         : parent.top
                    topMargin   : 220
                    right       : parent.right
                    rightMargin : 25
                }
                onClicked:  {
                    root.canceled();
                    hide();
                }
            }

        } // msg_bg
    } // bg_frame

    NumberAnimation {
        id          : enter_ani
        target      : msg_frame
        property    : "opacity"
        duration    : 300
        easing.type : Easing.InOutQuad
        from        : 0.3
        to          : 1
        onStopped:  {

        }
    }

    NumberAnimation {
        id          : hide_ani
        target      : msg_frame
        property    : "opacity"
        duration    : 300
        easing.type : Easing.InOutQuad
        from        : 1
        to          : 0.1
        onStopped: {
            root.finished();
            root.visible = false;
        }
    }

}

