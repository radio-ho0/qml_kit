import QtQuick 2.0
import "../widget/"

// this is a Weather Widget

Rectangle {
    id     : root
    
    width  : parent.width
    height : parent.height
    color  : "beige"
    property string src : "http://api.openweathermap.org/data/2.5/forecast?q=Zhuhai,cn&mode=json&appid=2de143494c0b295cca9337e1e96b00e0"


    Column {
        spacing: 5
        anchors.fill: parent
        anchors.margins: 5
        anchors.bottomMargin: 0
        
          ListView {
            id: list1
            width: parent.width
            height: parent.height

            JSONListModel {
		id : weather_model
		source : src
//		query: "$.store.book[*]"
		query : "$.list[*].weather[0]"
	    }
	    
            model: weather_model.model
            
            delegate: Component {
                Text {
                   width: parent.width
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 14
                    color: "black"
                    text: model.main
                    


                    Text {
                        anchors.fill: parent
                        anchors.rightMargin: 5
                        horizontalAlignment: Text.AlignRight
                        font.pixelSize: 12
                        color: "gray"
                        text: model.description
                    }
                }
            }
        }
}
  
}
