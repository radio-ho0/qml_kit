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

    Component.onCompleted : {
        page_model.clear();
 
        page_model.append({ title : "test Elabel",        page : "test/test_elabel.qml"});
        page_model.append({ title : "test EButton",       page : "test/test_ebutton.qml"});
        page_model.append({ title : "珠海天气",           page : "test/zh_weather.qml"});
        page_model.append({ title : "weather 3",          page : "test/weather3.qml"});
        page_model.append({ title : "Pic Viewer",         page : "test/pic_viewer.qml"});
        page_model.append({ title : "EGallery",           page : "test/test_gallery.qml"});
        page_model.append({ title : "JSON Path",          page : "test/json_path.qml"});
        page_model.append({ title : "font list",          page : "test/listfont.qml"});
        page_model.append({ title : "path_tester - js",   page : "test/path_tester.qml"});
        page_model.append({ title : "path tester - cpp",  page : "test/cpp_path.qml"});
        page_model.append({ title : "circle num and bar", page : "test/test_num_bar.qml"});
        page_model.append({ title : "pathline",           page : "test/test_pathline.qml"});
        page_model.append({ title : "data:img",           page : "test/img_data.qml"    });

    }

    
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
        ECurrTime {
            id         : curr_time
            timeout    : 5000
            color_time : "white"
            color_tip  : "gray"

            anchors {
                top   : parent.top
                right : parent.right
            }
        }

    } // header
    
    ListModel {
        id : page_model
    }


    StackView {
        id : stack_view
        anchors.fill:  parent
        focus:  true
        
        initialItem:  Item {
            width  : parent.width
            height : parent.height
            ListView {
                id           : menu_list
                model        : page_model
                anchors.fill : parent
                delegate:  EButton {
                    text       : title
                    width      : parent.width
                    height     : 70
                    color      : "#424246"
                    text_color : "#E4432C"
                    source     : ""
                    onClicked  : {
                        stack_view.push(Qt.resolvedUrl( page ));
                    }
                }
            }// menu_list

            ScrollBar {
                id         : stack_bar
                width      : 8
                scrollArea : menu_list

                anchors {
                    right  : menu_list.right
                    top    : menu_list.top
                    bottom : menu_list.bottom
                }
            }
        }
    } // stack_view

    EButton {
        id             : _bt_exit
        width          : 50
        height         : width
        anchors.left   : parent.left
        text_color     : "white"
        text           : "exit"
        anchors.bottom : parent.bottom
        color          : "red"
        onClicked:  {
//             var obj =    creatObj(root, "widget/EMsg.qml", {"x" :0, "y" : 0});
//            obj.show("zzz");
//            obj.accepted.connect(function(){
//                Qt.quit();
//                });
            var obj =   Kit.newObject("../widget/EMsg.qml", {"info": "zzz"}, root);
            obj.show("zzz");
            obj.accepted.connect(function(){
                Qt.quit();
            });
        }
    }

    function creatObj(parent, file, properties){
        var  component = Qt.createComponent( ( file ) );
        if (component.status === Component.Ready){
            var obj =  component.createObject(parent,  properties );
            if (obj === null) {
                console.log("Error creating object");
                return null;
            }
            return obj;
        } // createComponent
    }
}

