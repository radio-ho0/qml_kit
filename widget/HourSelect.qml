import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id     : root
    width  : 680
    height : 480
    color  : "beige"
    focus  : true

    Component.onCompleted : {
        setTimePoint("15:21");
    }

    function setTimePoint( str ){
        var arr     = str.split(':');
        var hour_idx   = Number(arr[0]);
        var minute_idx = Number(arr[1]);

        viewer.currentIndex  = setOffset( hour_idx );
        viewer2.currentIndex = setOffset( minute_idx );

        function setOffset( num ){
            return num - 1;
        }
    }

    function getTimePoint(){
        var hour_idx = viewer.currentIndex;
        var minute_idx = viewer2.currentIndex;

        return setOffset(hour_idx) + ":" + setOffset(minute_idx);

        function setOffset( num ){
            var bar = num + 1;
            return bar < 10 ? "0" + bar : "" + bar;
        }
    }


    PathView {
        id            : viewer
        width         : 100
        height        : 240
        model         : 24
        pathItemCount : 3

        delegate :   Delegate_hour {
            num : index < 10 ? "0" + index : "" + index
        }


        path: Path {
            id     : path1
            startX : 45
            startY : 49


            PathLine {
                id : pl1
                x  : 45
                y  : 274
            }

        }

    }


    PathView {
        id            : viewer2
        width         : 100
        height        : 240
        model         : 60
        pathItemCount : 3

        delegate :   Delegate_hour {
            num : index < 10 ? "0" + index : "" + index
        }


        path: Path {
            id     : path2
            startX : 45
            startY : 49


            PathLine {
                id : pl2
                x  : 45
                y  : 274
            }

        }

        anchors {
            left : viewer.right
            top  : viewer.top
        }
    }

    Rectangle {
        id     : _hr1
        width  : parent.width
        height : 4
        radius : 2

        color  : "darkgreen"
        anchors {
            top : parent.top
            topMargin : 80
        }
    }

        
    Rectangle {
        id     : _hr2
        width  : parent.width
        height : 4
        radius : 2

        color  : "darkgreen"

        anchors {
            top : parent.top
            topMargin : 150
        }
    }

}
