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


function escapeHTML(html) {
    return html.replace(/&/g, "&amp;").replace(/>/g, "&gt;").replace(/</g, "&lt;").replace(/"/g, "&quot;");
}


// 转换小数 a.toFix( n )
function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}



function add_zero (str, max) {
    return str.length < max ? add_zero("0" + str, max) : str;
}



function gettime(){

    var today = new Date();
    var h  = today.getHours();
    var m = today.getMinutes();
    var s   =today.getSeconds();

    var mytime = h  + ":" + m + ":" + s;
    return mytime;
}


//调用方法也很简单：
//GetDateDiff("2010-10-11 00:00:00", "2010-10-11 00:01:40", "day")
//这个是计算天数
//GetDateDiff("2010-10-11 00:00:00", "2010-10-11 00:01:40", "seond")是计算秒数     

function getDateDiff(startTime, endTime, diffType) {
    //将xxxx-xx-xx的时间格式，转换为 xxxx/xx/xx的格式
    startTime = startTime.replace(/\-/g, "/");
    endTime = endTime.replace(/\-/g, "/");
    //将计算间隔类性字符转换为小写
    diffType = diffType.toLowerCase();
    var sTime = new Date(startTime); //开始时间
    var eTime = new Date(endTime); //结束时间
    //作为除数的数字
    var divNum = 1;
    switch (diffType) {
        case "second":
            divNum = 1000;
            break;
        case "minute":
            divNum = 1000 * 60;
            break;
        case "hour":
            divNum = 1000 * 3600;
            break;
        case "day":
            divNum = 1000 * 3600 * 24;
            break;
        default:
            break;
    }
    //return parseInt((eTime.getTime() - sTime.getTime()) / parseInt(divNum));
    return (eTime.getTime() - sTime.getTime()) / divNum;
}

function prettyFloat(x,nbDec) {
    if (!nbDec) nbDec = 100;
    var a = Math.abs(x);
    var e = Math.floor(a);
    var d = Math.round((a-e)*nbDec); if (d == nbDec) { d=0; e++; }
    var signStr = (x<0) ? "-" : " ";
    var decStr = d.toString(); var tmp = 10; while(tmp<nbDec && d*tmp < nbDec) {decStr = "0"+decStr; tmp*=10;}
    var eStr = e.toString();
    return signStr+eStr+"."+decStr;
}


function getIndex(n ){
    if(n == 1){
        for(var i = 0; i < n * NP; ++i){
            console.log(nums[i]);
        }
    }else{
        for(var i = (n -1) * NP; i < n* NP; ++i){
            console.log(nums[i]);
        }

    }
}
