import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Particles 2.0


ProgressBarStyle {
    id : root

    property var res_prefx : "../pics/"
    property var bar_bg    : res_prefx + "bar_bg.png"
    property var bar_img   : res_prefx + "rainbow.png"
    property var burn_img  : res_prefx + "burn.png"
    property var star_img  : res_prefx + "star.png"

    background: BorderImage {
        source        : bar_bg
        border.left   : 2
        border.right  : 2
        border.top    : 2
        border.bottom : 2
        Image {
            source       : bar_img
            anchors.fill : parent
        }
        Rectangle {
            id     : _bar2
            color  : "black"
            radius : 8
            height : parent.height - 2
            width : {
                return (control.width * (1 - control.value)) - 5
            }
            anchors.right: parent.right
            anchors.rightMargin: 5
        }

        Image {
            id      : _light
            source  : burn_img
            visible : control.value < control.maximumValue
            anchors {
                right                : _bar2.left
                rightMargin          : -27
                verticalCenter       : parent.verticalCenter
                verticalCenterOffset : -2
            }
        }

    }
    progress: Item {
        //                clip: true
        BorderImage {
            anchors.fill        : parent
            anchors.rightMargin : (control.value < control.maximumValue) ? -4 : 0
            source              : ""
            border.left         : 10
            border.right        : 10

        }
        ParticleSystem {
            id      : bubbles
            running : visible
        }
        ImageParticle {
            id       : fireball
            system   : bubbles
            source   : star_img
            opacity  : 0.7
            rotation : 0
            rotationVariation         : 45
            rotationVelocity          : 15
            rotationVelocityVariation : 15
            entryEffect:  ImageParticle.Scale
            visible:  {
                if(control.value >= 1){
                    return false;
                }else{
                    return true;
                }
            }

        }
        Emitter {
            id       : emitter
            width    : 1
            height   : 1
            size     : 15
            emitRate : 35
            system   : bubbles

            lifeSpan               : 2500
            lifeSpanVariation      : 500
            anchors.right          : parent.right
            anchors.verticalCenter : parent.verticalCenter


            velocity :PointDirection {
                x          : -15
                y          : 0
                xVariation : 10
                yVariation : 100 / 7
            }
        }
    }
}
