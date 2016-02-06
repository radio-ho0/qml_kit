import QtQuick 2.0
import "../widget/"
import "../js/kit.js" as Kit

Rectangle {
    id                              : root

    width                           : parent.width
    height                          : parent.height
    color                           : "beige"
    
    property string res_dir         : "../pics/"
    property string got_this_string : ""

    signal jsonOK();
    onJsonOK : {

        my_weather_model.clear();
        var weather_obj = JSON.parse( got_this_string );
        var list_length = weather_obj.list.length ;

        print(" weather list length " + list_length );

        for( var i = 0; i < list_length ; ++i ){
            my_weather_model.append(
                {
                    "m_main"        : weather_obj.list[ i ].weather[0].main,
                    "m_date"        : weather_obj.list[ i ].dt_txt,
                    "m_description" : weather_obj.list[ i ].weather[0].description,
                    "m_icon"        : weather_obj.list[ i ].weather[0].icon,
                    "m_humidity"    : weather_obj.list[ i ].main.humidity,
                    "m_temperature" : weather_obj.list[ i ].main.temp
                }
            );
        }
    }

    Component.onCompleted : {
        print("aHa!");
        got_weather( Kit.zh_weather_url );

        my_weather_model.append(
            {
                "m_main"        : "Sunny",
                "m_date"        : "2015-11-11",
                "m_description" : " very Good!",
                "m_icon"        : "01n",
                "m_humidity"    : 60,
                "m_temperature" : 301
            }
        );
	var date = new Date();
	var month = date.getUTCMonth() + 1 ;
	var year = date.getUTCFullYear();
	title.text = year + "-" + month + "-" + date.getUTCDate() + "        珠海天气";
    }

    Text {
        id             : title
        text           : "Zhuhai weather!"
        font.pointSize : 24
        color          : "orange"
        anchors {
            top        : parent.top
        }
    }

    ListModel {
        id : my_weather_model
    }

    ListView {
        id                 : viewer
        width              : parent.width
        height             : parent.height
        anchors {
            top       : title.bottom
            topMargin : 30
            left      : parent.left
        }
        spacing            : 10
        model              : my_weather_model

        delegate           : Weather_delegate{
            source      : res_dir + "weather/" + translate_icon( m_icon );
            date        : m_date
            description : translate_description( m_icon )
            humidity    : m_humidity + " %"
            temperature : kelvin_to_celsius( m_temperature ) + "ºC"
        }

    }

    ScrollBar {
        id         : font_list_bar
        width      : 8
        scrollArea : viewer

        anchors {
            right  : viewer.right
            top    : viewer.top
            bottom : viewer.bottom
        }
    }

    function  kelvin_to_celsius( foo ){
	    var temp_c = foo - 273.15;
	    
	    return temp_c.toFixed(2);
    }

    function translate_icon( which ){
	    //return "weather-clear.png"
	    var dict = {
		    "01d" : "weather-clear.png",
		    "01n" : "weather-clear-night.png",
		    "02d" : "weather-clouds.png",
		    "02n" : "weather-clouds-night.png",
		    "03d" : "weather-many-clouds.png",
		    "03n" : "weather-many-clouds.png",
		    "04d" : "04d.png",
		    "04n" : "04n.png",
		    "09d" : "weather-showers-day.png",
		    "09n" : "weather-showers-night.png",
		    "10d" : "10d.png",
		    "10n" : "10n.png",
		    "11d" : "11d.png",
		    "11n" : "11d.png",
		    "13d" : "13d.png",
		    "13n" : "13d.png",
		    "50d" : "50d.png",
		    "50d" : "50d.png",

		    "end_of_dict" : "__"
	    }

	    return dict[ which ];
    }
    
    function translate_description( which ){
	    //return "weather-clear.png"
	    var dict = {
		    "01d" : "天气晴朗",
		    "01n" : "天气晴朗",
		    "02d" : "少到多云",
		    "02n" : "少到多云",
		    "03d" : "多云",
		    "03n" : "多云",
		    "04d" : "阴到多云",
		    "04n" : "阴到多云",
		    "09d" : "下雨",
		    "09n" : "下雨",
		    "10d" : "阵雨",
		    "10n" : "阵雨",
		    "11d" : "行雷闪电",
		    "11n" : "行雷闪电",
		    "13d" : "下雪",
		    "13n" : "下雪",
		    "50d" : "雾天",
		    "50d" : "雾天",

		    "end_of_dict" : "__"
	    }

	    return dict[ which ];
    }
    

    function got_weather( str_source ){
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

}


