import QtQuick 2.0
import "../js/kit.js" as Kit
Text {
    id                  : root
    property alias color: root.color
    property alias font : root.font
    text                : ""
    verticalAlignment   : Text.AlignVCenter
    horizontalAlignment : Text.AlignHCenter
    font.family         : Kit.font_default
    font.pointSize      : 24
}
