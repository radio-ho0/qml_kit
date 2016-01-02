import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import "./widget"

ApplicationWindow  {
    id : root
    visible: true
    width : 800
    height  : 600
    color : "beige"

    toolBar:
        Rectangle {
            id : header
            width : parent.width
            height :  60
            color :  "#78ba00"

           EButton {
                id : bt_back
                width : opacity ? 60 : 0
                height : parent.height
                anchors.left:  parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter:  parent.verticalCenter
                radius :  8
                opacity:  stack_view.depth > 1 ? 1 : 0
                text : qsTr("<back")
            //    antialiasing: true
                Behavior on opacity {
                    NumberAnimation{}
                }

                onClicked:  {
                    stack_view.pop();
                }
           }
           Text {
               id : title
               x : bt_back.x + bt_back.width + 40
               anchors.verticalCenter:  parent.verticalCenter
               color : "white"
               font.pointSize:  42
               text : "ele1000 QML_kit"

               Behavior on x {
                   NumberAnimation{
                       easing.type: Easing.OutCubic
                   }
               }
           }

        } // header

    ListModel {
        id: page_model
        ListElement {
            title: "Pic Viewer"
            page: "test/pic_viewer.qml"
        }
        ListElement {
            title: "Weather 1"
            page: "test/weather.qml"
        }

    }


    StackView {
        id : stack_view
        anchors.fill:  parent
        focus:  true

        initialItem:  Item {
            width : parent.width
            height : parent.height
            ListView {
                model : page_model
                anchors.fill : parent
                delegate:  EButton {
                    text : title
                    width : parent.width
                    height : 70
                    color: "#424246"
                    source : ""
                    onClicked:  {
                        stack_view.push(Qt.resolvedUrl( page ));
                    }
                }
            }
        }
    }
}

