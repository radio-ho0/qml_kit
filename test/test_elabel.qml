import QtQuick 2.0
import "../widget"

Rectangle {
	id     : root
	width  : parent.width
	height : parent.height
	color  : "beige"

	ELabel {
		id    : i1
		text  : "hello"
        color : "orangered"
	}
	ELabel {
		id          : i2
		text        : "world"
		x           : 100
		font.family : "DejaVu Serif"
        color       : "orange"
	}
}

