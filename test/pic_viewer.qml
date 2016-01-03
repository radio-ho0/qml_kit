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

	function creatObj( file ){
		var  component = Qt.createComponent( ( file ) );
		if (component.status === Component.Ready){
			var obj =  component.createObject(root, {"x": 0, "y": 0, });
			if (obj === null) {
				console.log("Error creating object");
			}
		} // createComponent
	}
}


