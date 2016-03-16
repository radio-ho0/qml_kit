import QtQuick 2.0
import QtQuick.Controls 1.4
import "../widget"

Rectangle {
	id     : root
	width  : parent.width
	height : parent.height
	color  : "beige"

    ECircleNum {
        id  : _num1
        num : "42"
        x   : 10
        y   : 10
    }
    Column {

        x : 50
        y : 60
        spacing:  30

        ProgressBar {
            value          : 0.5
            style          : EProgressBarStyle{
                bg_color   : "black"
                fill_color : "tomato"
            }
        }
        ProgressBar {
            indeterminate: true
        }

        Slider {
            id     : _slider

            width  : 252
            height : 27
        }

        ProgressBar {
            value : _slider.value
            style : EProgressBarStyle3{
            }
        }
    }

}

