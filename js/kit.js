/**
 * @overview for qml_kit
 *
 * @author  ele1000
 * @version 2016/01/10
 */

.pragma library
.import QtQuick 2.0 as QtQuick

var zh_weather_url = "http://api.openweathermap.org/data/2.5/forecast?q=Zhuhai,cn&mode=json&appid=5819a34c58f8f07bc282820ca08948f1";

var color_tomato      = "tomato"
var color_temperature = color_tomato
var color_date        = "#963701"
var color_bg          = "beige"
var color_nav_bar     = "#78ba00"

var font_default      = "WenQuanYi Zen Hei"

// from Qt example image-gallery

    function sizeStringFromFile(fileData) {
        var str = [];
        if (fileData && fileData.fileSize) {
            str.push("Size: ");
            str.push(fileData.fileSize);
            str.push(" bytes");
        }
        return str.join("");
    }

    function doubleDigitNumber(number) {
        if (number < 10)
            return "0" + number;
        return number;
    }

    function timeStringFromFile(fileData) {
        var str = [];
        if (fileData && fileData.createdAt) {
            var date = new Date(fileData.createdAt);
            if (date) {
                str.push("Uploaded: ");
                str.push(date.toDateString());
                str.push(" ");
                str.push(doubleDigitNumber(date.getHours()));
                str.push(":");
                str.push(doubleDigitNumber(date.getMinutes()));
            }
        }
        return str.join("");
    }
    
// from: https://github.com/papyros/qml-material/blob/develop/modules/Material/Extras/js/utils.js


function newObject(path, args, parent) {
    if (!args)
        args = {};

    args.parent = parent;

    var component = Qt.createComponent(path);
    if (component.status === QtQuick.Component.Error) {
        // Error Handling
        print("Unable to load object: " + path + "\n" + component.errorString());
        return null;
    }

    return component.createObject(parent, args);
}

function nth(d) {
    if(d>3 && d<21)
        return 'th'; // thanks kennebec

    switch (d % 10) {
        case 1:  return "st";
        case 2:  return "nd";
        case 3:  return "rd";
        default: return "th";
    }
}
