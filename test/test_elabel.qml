import QtQuick 2.0
import "../widget"

Rectangle {
	id : root
	width : 480
	height  : 360
	color : "beige"

	ELabel {
		id : i1
		text : "hello"
        color : "orangered"
	}
	ELabel {
		id  : i2
		text : "world"
		x : 100
        color : "orange"
	}
}

