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
        onMqtt_cnted: {
            console.info("mqtt cnt")
            rectangle_ok.color = "#6bb7fa"
        }
        onMqtt_discnt: {
            rectangle_ok.color = "#9d9087"
        }

    }

    Rectangle {
        id: rectangle_ok
        y: 288
        height: 138
        color: "#9d9087"
        //color: "#6bb7fa"
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

        Text {
            id: text_ok
            x: 204
            y: 28
            width: 174
            height: 35
            text: qsTr("OK")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
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
        anchors.left: rectangle_ok.left
        anchors.bottom: rectangle_ok.top
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
                    textEdit.append("home/led0*switch")
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
        anchors.right: rectangle_ok.right
        anchors.bottom: rectangle_ok.top
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
                textEdit.append("home/led0*sub")
            }
        }
    }
}
