import QtQuick 2.0
import "../js/jsonpath.js" as JSONPath
import "../widget"

// this is a Weather Widget

Rectangle {
    id     : root
    width  : 800
    height : 600
    color  : "beige"
    
    signal jsonOK();
    
    onJsonOK : {
		parseJSONString( title, got_this_string , query_city_name);
                parseJSONString( day1_info, got_this_string , day1_weather);
                parseJSONString( day2_info, got_this_string , day2_weather);
                parseJSONString( day3_info, got_this_string , day3_weather);
    }

    property string json_src        : 'http://api.openweathermap.org/data/2.5/forecast?q=Zhuhai,cn&mode=json&appid=2de143494c0b295cca9337e1e96b00e0'
    property string query_city_name : "$.city.name"
    property string got_this_string : ""
    property string day1_weather    : "$.list[0].weather[0].description"
    property string day2_weather    : "$.list[3].weather[0].description"
    property string day3_weather    : "$.list[6].weather[0].description"

    Component.onCompleted:  {
        got_weather( json_src )
    }

    function got_weather(  str_source){
        var xhr = new XMLHttpRequest;
        xhr.open("GET", str_source );
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                got_this_string = xhr.responseText;
		root.jsonOK();
            }
        }
        xhr.send();
    }

    function parseJSONString( component, jsonString, jsonPathQuery) {
        var objectArray = JSON.parse(jsonString);
        var goal_arr;
        if ( jsonPathQuery !== "" ){
            goal_arr = JSONPath.jsonPath(objectArray, jsonPathQuery);
        }
        print("in the parese " + goal_arr);
        component.text = goal_arr.toString();
        return goal_arr;
    }

    Rectangle {
        id           : header
        width        : parent.width
        height       : 50
        color        : "orange"
        anchors.top  : parent.top
        anchors.left : parent.left
        Text {
            id             : title
            text           : "The Weather"
            anchors.fill   : parent
            color          : "white"
            font.pointSize : 28
            Text {
                id             : sub_title
                height         : parent.height
                anchors.right  : parent.right
                font.pointSize : 28
                text           : "'s Weather"
            }
        }

    }

    Column{
        id     : r_all
        x      : 0
        y      : 51
        width  : 250
        height : parent.height - 250

        Row{
            id     : day1
            width  : 250
            height : 50
            Rectangle {
                id     : rect
                width  : parent.width
                height : parent.height
                color  : Qt.rgba( Math.random(), Math.random(),
                                Math.random(), 0.5)

                Text  {
                    id                  : day1_info
                    color               : "White"
                    text                : "Day1"
                    anchors.fill        : parent
                    verticalAlignment   : Text.AlignVCenter
                    horizontalAlignment : Text.AlignHCenter
                }
            }
        } // day1

        Row{
            id     : day2
            width  : 250
            height : 50

            Rectangle {
                id     : rect_2
                width  : parent.width
                height : parent.height
                color  : Qt.rgba( Math.random(), Math.random(),
                                Math.random(), 0.5)

                Text  {
                    id                  : day2_info
                    color               : "White"
                    text                : "Day1"
                    anchors.fill        : parent
                    verticalAlignment   : Text.AlignVCenter
                    horizontalAlignment : Text.AlignHCenter
                }
            }
        } // day2

        Row{
            id     : day3
            width  : 250
            height : 50

            Rectangle {
                id     : rect3
                width  : parent.width
                height : parent.height
                color  : Qt.rgba( Math.random(), Math.random(),
                                Math.random(), 0.5)

                Text  {
                    id                  : day3_info
                    color               : "White"
                    text                : "Day1"
                    anchors.fill        : parent
                    verticalAlignment   : Text.AlignVCenter
                    horizontalAlignment : Text.AlignHCenter
                }
            }
        } // day3
    }


}
