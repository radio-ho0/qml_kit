import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import "./widget"
import "./js/kit.js" as Kit

ApplicationWindow  {
    id      : root
    visible : true
    width   : 800
    height  : 600
    color   : Kit.color_bg
    
    toolBar:
    Rectangle {
        id     : header
        width  : parent.width
        height : 60
        color  : Kit.color_nav_bar
        
        EButton {
            id                     : bt_back
            width                  : opacity ? 60 : 0
            height                 : parent.height
            anchors.left           : parent.left
            anchors.leftMargin     : 15
            anchors.verticalCenter : parent.verticalCenter
            radius                 : 8
            opacity                : stack_view.depth > 1 ? 1 : 0
            text                   : qsTr("<back")
            antialiasing           : true
            Behavior on opacity {
                NumberAnimation{}
            }
            
            onClicked:  {
                stack_view.pop();
            }
        }
        Text {
            id                     : title
            x                      : bt_back.x + bt_back.width + 40
            anchors.verticalCenter : parent.verticalCenter
            color                  : "white"
            font.pointSize         : 42
            text                   : "ele1000 QML_kit"
            
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
            title : "test ELabel"
            page  : "test/test_elabel.qml"
        }
        ListElement {
            title : "test EButton"
            page  : "test/test_ebutton.qml"
        }

        ListElement {
            title : "珠海天气"
            page  : "test/zh_weather.qml"
        }

        ListElement {
            title : "Pic Viewer"
            page  : "test/pic_viewer.qml"
        }
        ListElement {
            title : "test JSON PATH"
            page  : "test/json_path.qml"
        }
        ListElement {
            title : "Weather 3"
            page  : "test/weather3.qml"
        }
        ListElement {
            title : "font list"
            page  : "test/listfont.qml"
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
                    text_color : "#E4432C"
                    source : ""
                    onClicked:  {
                        stack_view.push(Qt.resolvedUrl( page ));
                    }
                }
            }
        }
    }
}

