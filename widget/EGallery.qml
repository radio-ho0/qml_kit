import QtQuick 2.0

Rectangle {
    id     : root
    width  : 640
    height : 410
    color  : "chocolate"

    property alias model        : view.model
    property alias frame_color  : frame.color
    property alias border_color : pic_border.color
    property var   pic_prefix   : "pics"
    property var   hide_status  : false
    property var   img_width    : 522
    property var   img_height   : 322
    property var   nav_margin   : 20
    property var   move_duration : 250

    property var setArray : function( pic_array ){
        arr_model.clear();
        for(var i = 0; i < pic_array.length; ++i){
               arr_model.append({
                    image : pic_array[i]
                  });
        }
        view.model = arr_model;
    }

    property alias currentIndex : view.currentIndex

    Component.onCompleted:  {
        var n_count = model.count
        switch( n_count ){
        case 1:
            next_page.visible = false;
            prev_page.visible = false;
            break;
        case 2:
            prev_page.visible = false;
            next_page.visible = true;
            break;
        }

        if(hide_status){
            nav_bar.visible = false;
        }else{
            nav_bar.visible = true;
        }
    }

    Rectangle {
        id                             : frame
        width                          : img_width + 20
        height                         : img_height + 20
        color                          : "#b9b9b9"
        radius                         : 8
        anchors.verticalCenterOffset   : -5
        anchors.horizontalCenterOffset : 0
        anchors.horizontalCenter       : parent.horizontalCenter
        anchors.verticalCenter         : parent.verticalCenter

        Rectangle {
            id                       : pic_border
            width                    : img_width
            height                   : img_height
            clip                     : true
            color                    : "white"
            anchors.horizontalCenter : parent.horizontalCenter
            anchors.verticalCenter   : parent.verticalCenter

            ListView {
                id :  view
                anchors {
                    fill: parent;
                }
                clip : true
                model                   : model
                delegate                : pic_delegate
                preferredHighlightBegin : 0
                preferredHighlightEnd   : 0
                orientation             : ListView.Horizontal
                highlightRangeMode      : ListView.StrictlyEnforceRange
                snapMode                : ListView.SnapOneItem
                flickDeceleration       : 2000
                cacheBuffer             : 200
                highlightMoveDuration   : root.move_duration

                onCurrentIndexChanged: {
                    if(view.currentIndex === view.count - 1){
                        next_page.visible = false;
                        prev_page.visible = true;
                    }else if(view.currentIndex === 0){
                        prev_page.visible = false;
                        if(view.count > 1){
                           next_page.visible = true;
                        }
                    }else {
                        next_page.visible = true;
                        prev_page.visible = true;
                    }

                }
            }
        }
    }  // frame

    Component {
            id : pic_delegate
        Item{

            width  : pic_border.width
            height : pic_border.height
            Rectangle {
                anchors.fill : parent
                color : "transparent"

                Image {
                    id           : bg
                    source       : pic_prefix + image
                    anchors.fill : parent
                    fillMode     : "Stretch"
                    clip         : true
                }
            }
        }
    }

    ListModel {
        id : arr_model
    }


    Rectangle {
        id : nav_bar

        anchors {
            top              : frame.bottom
            topMargin        : nav_margin
            horizontalCenter : frame.horizontalCenter
        }

        width  : parent.width
        height : 27
        color  : "transparent"
        clip   : true
        Row {
            anchors.centerIn : parent
            spacing          : 20

            Repeater {
                model: view.model.count

                Item {
                    width  : 27
                    height : 27
                    clip   : true

                    ECircle {
                        id : _point
                        width : 27
                        height : width
                        color  : (view.currentIndex == index ) ? "yellowgreen" : "lightyellow"
                        anchors.fill : parent
                    }
                    
                    MouseArea {
                        anchors.fill : parent
                        onClicked    : {

                            view.currentIndex = index;
                            var model_count = view.model.count;
                            if( model_count > 1 ){
                                if(index == 0){
                                    next_page.visible = true;
                                }else if( index == model_count -1){
                                    prev_page.visible = true;
                                }
                            } // model_count > 1
                        } // onClicked
                    }// mousearea
                }
            }
        }
    }     // nav_bar

    EButton{
        id     : next_page
        width  : 46
        height : 86
        source : ""
        color  : "olive"
        text   : "N"

        anchors {
            left : frame.right
            verticalCenter: frame.verticalCenter
        }
        onClicked: {
            view.incrementCurrentIndex();
        }
    }
    EButton{
        id     : prev_page
        width  : 46
        height : 86
        source : ""
        color  : "green"
        text   : "P"

        anchors {
            right : frame.left
            verticalCenter: frame.verticalCenter
        }

        onClicked: {
            view.decrementCurrentIndex();
        }
    }

}
