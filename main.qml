import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("InBin")

    Rectangle {
        id: mainStage
        anchors.fill: parent

        Rectangle {
            id:topBar
            height: 50
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            color: "#3498db"

            Text {
                id: topLabel
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.pixelSize: 50
                color: "white"
                text: "InBin"
                anchors.fill: parent
            }
        }

        Button {
            id: scanButton
            height: 50
            text: qsTr("Zeskanuj kod produktu")
            anchors.margins: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: topBar.bottom
            backgroundColor: "#669e4f"
            borderColor: "#18bc9c"
            radius: 5
        }

        Image {
            id: recyclingImage
            width: parent.width - 20
            height: width
            source: "qrc:/recycling.png"
            anchors.centerIn: parent
        }

        Rectangle {
            id:searchBar
            height: 70
            anchors {
                bottom: footer.top
                left: parent.left
                right: parent.right
                bottomMargin: 2
            }
            color: "#2c3e50"

            LineInput {
                id: lineInput
                anchors { fill: parent; margins: 6 }
                onAccepted: {
                    if (Qt.inputMethod.visible)
                        Qt.inputMethod.hide()
                    //flipBar.ok()
                }
            }
        }

        Rectangle {
            id:footer
            height: 50
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: "#3498db"
            Text {
                id: footerLabel
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.bold: true
                font.pixelSize: 50
                color: "white"
                text: "Płock"
            }
        }
    }

//    Connections {
//        target: scanButton
//        onClicked: {

//        }
//    }
}
