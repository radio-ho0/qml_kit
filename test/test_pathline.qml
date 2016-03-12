import "../widget"
import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id     : root
    width  : 480
    height : 360
    color  : "lightgray"
    focus  : true

    Component.onCompleted : {
        viewer.currentIndex = 12;
    }

    PathView {
        id           : viewer
        anchors.fill : parent
        model        : 24

        delegate :  ECircleNum{
            num     : index
            z       : PathView.zOrder;
            opacity : PathView.itemAlpha;
            scale   : PathView.itemScale;
        }
        path: Path {
            id     : path1
            startX : 50
            startY : 0

            PathAttribute { name: "zOrder"    ; value: 0 }
            PathAttribute { name: "itemAlpha" ; value: 0.1 }
            PathAttribute { name: "itemScale" ; value: 0.5}

            PathLine {
                id : pl1
                x  : 50
                y  : 100
            }

            PathAttribute { name: "zOrder"    ; value: 1}
            PathAttribute { name: "itemAlpha" ; value: 1 }
            PathAttribute { name: "itemScale" ; value: 1}

            PathLine {
                id : pl2
                x  : 50
                y  : 200
            }

            PathAttribute { name: "zOrder"    ; value: 0 }
            PathAttribute { name: "itemAlpha" ; value: 0.1 }
            PathAttribute { name: "itemScale" ; value: 0.5 }
        }

    }

    Column {
        id : col_adjust
        spacing : 3

        anchors.right : parent.right

        EButton {
            id : bt_path1
            width : 120
            height: 30
            text : "startX +"
            color : "tomato"

            onClicked :{
                path1.startX += spin_step.value;
            }
        }

        EButton {
            id : bt_path2
            width : 120
            height: 30
            text : "startX -"
            color : "tomato"


            onClicked :{
                path1.startX -= spin_step.value;
            }
        }


        EButton {
            id     : bt_pl1_x_plus
            width : 120
            height : 30
            text   : "pl1 x +"
            color  : "olive"

            onClicked :{
                pl1.x += spin_step.value;
            }
        }

        EButton {
            id     : bt_pl1_x_min
            width : 120
            height : 30
            text   : "pl1 x -"
            color  : "olive"
            onClicked :{
                pl1.x -= spin_step.value;
            }
        }


        EButton {
            id     : bt_pl1_y_plus
            width : 120
            height : 30
            text   : "pl1 y +"
            color  : "lightcoral"

            onClicked :{
                pl1.y += spin_step.value;
            }
        }

        EButton {
            id     : bt_pl1_y_min
            width : 120
            height : 30
            text   : "pl1 y -"
            color  : "lightcoral"

            onClicked :{
                pl1.y -= spin_step.value;
            }
        }

        EButton {
            id     : bt_pl2_x_plus
            width : 120
            height : 30
            text   : "pl2 x +"
            color  : "royalblue"

            onClicked :{
                pl2.x += spin_step.value;
            }
        }

        EButton {
            id     : bt_pl2_x_min
            width : 120
            height : 30
            text   : "pl2 x -"
            color  : "royalblue"
            onClicked :{
                pl2.x -= spin_step.value;
            }
        }


        EButton {
            id     : bt_pl2_y_plus
            width : 120
            height : 30
            text   : "pl2 y +"
            color  : "firebrick"

            onClicked :{
                pl2.y += spin_step.value;
            }
        }

        EButton {
            id     : bt_pl2_y_min
            width : 120
            height : 30
            text   : "pl2 y -"
            color  : "firebrick"

            onClicked :{
                pl2.y -= spin_step.value;
            }
        }

    } // col

    Row {
        id : row_spin

        ECircle {
            color : "tomato"

        }
        SpinBox {
            id     : spin_step
            width  : 160
            height : 25
            value  : 5
        }

        anchors.right : col_adjust.left
    }

    function updateAttr(){
        print("startX: " + path1.startX + " startY : " + path1.startY + " pl1.x: " 
        + pl1.x + " pl1.y : " + pl1.y + " pl2.x : " + pl2.x + " pl2.y : "+ pl2.y );
    }

    EButton {
        id             : _get
        anchors.right  : _exit.left
        anchors.bottom : parent.bottom
        width          : 80
        height         : 30
        text           : "Get"
        color          : "lightblue"

        onClicked : {
            updateAttr();
        }

    }

    EButton {
        id             : _exit
        anchors.right  : parent.right
        anchors.bottom : parent.bottom
        width          : 80
        height         : 30
        text           : "EXIT"
        color          : "orangered"
        onClicked  : {
            Qt.quit();
        }
    }

    Keys.onPressed : {

        switch( event.key ){
            case Qt.Key_Escape :
                Qt.quit();
            case Qt.Key_Space:
                updateAttr();
                break;

            case Qt.Key_Plus :
            case Qt.Key_Up   :
                spin_step.value += 1;
                break;
            case Qt.Key_Down  :
            case Qt.Key_Minus :
                spin_step.value -= 1;
                break;
        }

    }

}
