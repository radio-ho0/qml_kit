import QtQuick 2.0
import QtQml.Models 2.1

import "../widget"

Rectangle {
	id     : root
	width  : parent.width
	height : parent.height
	color  : "beige"

	ObjectModel {
		id : pic_model
		Image {
			width  : 700
			height : 394
			source : "../pics/1.png"
		}
		Image {
			width  : 700
			height : 394
			source : "../pics/2.png"
		}
		Image {
			width  : 700
			height : 394
			source : "../pics/3.png"
		}
	}
	EpicSlider{
		id               : viewer
		model            : pic_model
		anchors.centerIn : parent
	}

}


