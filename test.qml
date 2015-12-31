import QtQuick 2.0
import QtQml.Models 2.1

Rectangle {
	id     : root
	width  : 800
	height : 600
	color  : "beige"

	ObjectModel {
		id : pic_model
		Image {
			width  : 700
			height : 394
			source : "pics/1.png"
		}
		Image {
			width  : 700
			height : 394
			source : "pics/2.png"
		}
		Image {
			width  : 700
			height : 394
			source : "pics/3.png"
		}
	}
	EpicSlider{
		id               : viewer
		model            : pic_model
		anchors.centerIn : parent
	}

	EButton {
		id             : bt_exit
		color          : "orangered"
		text           : qsTr("Exit")
		anchors.right  : parent.right
		anchors.bottom : parent.bottom

		onClicked : {
			Qt.quit();
		}
	}





}

