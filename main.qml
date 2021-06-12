import QtQuick 2.12
import QtQuick.Window 2.12
import Mqtt 1.0

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    LusMqtt{
        id: mqtt

    }
    Rectangle {
        id: rectangle
        y: 288
        height: 138
        color: "#6bb7fa"
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        anchors.bottomMargin: 50

        MouseArea {
            id: mouseArea
            y: 50
            height: 100
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 50
            anchors.rightMargin: 49
            anchors.bottomMargin: 10
            onClicked: {
                mqtt.mqttpublish(textEdit.text)
                textEdit.clear()
                textEdit.append("home/")
            }
        }
    }

    TextEdit {
        id: textEdit
        x: 242
        width: 260
        height: 45
        text: qsTr("home/")
        anchors.top: parent.top
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        renderType: Text.NativeRendering
        anchors.topMargin: 60
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: rectangle_on
        y: 202
        width: 100
        height: 50
        color: "#6bb7fa"
        radius: 10
        anchors.left: rectangle.left
        anchors.bottom: rectangle.top
        anchors.bottomMargin: 30
        anchors.leftMargin: 0

        MouseArea {
            id: mouseArea1
            x: 5
            y: 3
            width: 95
            height: 47
            onClicked: {
                    textEdit.clear()
                    textEdit.append("home/fan0*on")
            }
        }
    }

    Rectangle {
        id: rectangle_off
        x: 440
        y: 203
        width: 100
        height: 50
        color: "#6bb7fa"
        radius: 10
        anchors.right: rectangle.right
        anchors.bottom: rectangle.top
        anchors.bottomMargin: 30
        anchors.rightMargin: 0

        MouseArea {
            id: mouseArea2
            x: 11
            y: 2
            width: 89
            height: 48
            onClicked: {
                textEdit.clear()
                textEdit.append("home/fan0*off")
            }
        }
    }
}
