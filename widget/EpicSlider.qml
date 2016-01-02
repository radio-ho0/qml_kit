import QtQuick 2.0

Rectangle {
    id     : root
    width  : 640
    height : 410
    color  : "chocolate"

    property alias model: view.model

    Rectangle {
        id                             : frame
        width                          : 540
        height                         : 340
        color                          : "gold"
        radius                         : 8
        anchors.verticalCenterOffset   : -5
        anchors.horizontalCenterOffset : 0
        anchors.horizontalCenter       : parent.horizontalCenter
        anchors.verticalCenter         : parent.verticalCenter

        Rectangle {
            id                       : pic_border
            width                    : 522
            height                   : 322
            clip                     : true
            color                    : "transparent"
            anchors.horizontalCenter : parent.horizontalCenter
            anchors.verticalCenter   : parent.verticalCenter

            ListView {
                id :  view
                anchors {
                    fill: parent;
//                    bottomMargin: 36
                }
                clip : true
                model                   : model
                preferredHighlightBegin : 0
                preferredHighlightEnd   : 0
                orientation             : ListView.Horizontal
                highlightRangeMode      : ListView.StrictlyEnforceRange
                snapMode                : ListView.SnapOneItem
                flickDeceleration       : 2000
                cacheBuffer             : 200

                onCurrentIndexChanged: {
                    if(view.currentIndex === view.count - 1){
                        next_page.visible = false;
                    }else if(view.currentIndex === 0){
                        prev_page.visible = false;
                    }else {
                        next_page.visible = true;
                        prev_page.visible = true;
                    }
                }
            }
        }
    }  // frame

    Rectangle {
        id : nav_bar
        x      : 0
        y      : 400
        width  : parent.width
        height : 27
        color  : "transparent"
        clip   : true
        Row {
            anchors.centerIn: parent
            spacing: 20

            Repeater {
                model: view.model.count

                Item {
                    width  : 30
                    height : 30
                    clip   : true

                    Rectangle {
			id : circle
			anchors.fill : parent
			anchors.margins : 5
			color  :    view.currentIndex == index ? "greenyellow" : "green"
			radius : width / 2
                    }
                    MouseArea {
                        anchors.fill : parent
                        onClicked    : view.currentIndex = index
                    }
                }
            }
        }
    }     // nav_bar

    EButton{
        id     : next_page
        x      : 594
        y      : 173
        width  : 46
        height : 86
        anchors.verticalCenter: parent.verticalCenter
        source : ""
	text : "N"
	color  : "olive"
        onClicked: {
            view.incrementCurrentIndex();
        }
    }
    EButton{
        id     : prev_page
        x      : 0
        y      : 168
        width  : 46
        height : 86
        anchors.verticalCenter: parent.verticalCenter
        source : ""
	text : "P"
	color  : "palegreen"
        onClicked: {
            view.decrementCurrentIndex();
        }
    }


}
