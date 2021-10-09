import QtQuick 2.12

Item {
    id: root
    implicitHeight: 16
    implicitWidth: label.paintedWidth + 8
    signal clicked()
    property alias text: label.text
    property alias radius: background.radius
    property color backgroundColor: "grey"
    property color borderColor: "grey"
    property color textColor: "white"

    Rectangle {
        id: background
        anchors.fill:parent
        border.color: borderColor
        border.width: 1
        color: root.enabled ? ma.pressed ? Qt.lighter(backgroundColor): backgroundColor : Qt.darker(backgroundColor)
        Text {
            id: label
            anchors.centerIn: parent
            font.pixelSize: parent.height * 0.6
            color: root.enabled ? textColor : Qt.darker(textColor)
            text: "Button"
        }
        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
