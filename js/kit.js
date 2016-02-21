/**
 * @overview for qml_kit
 *
 * @author  ele1000
 * @version 2016/01/10
 */

.pragma library

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
    
    