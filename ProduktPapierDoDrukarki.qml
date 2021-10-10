import QtQuick 2.12
import QtMultimedia 5.12
import QtQuick.Window 2.15
import com.scythestudio.scodes 1.0

Column {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.left: parent.left
    anchors.right: parent.right
    spacing: 5

    Rectangle {
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#ecf0f1"

        Text{
            id:productLabel
            anchors.left: parent.left
            text: "Produkt:"
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter
        }
        Text{
            id:product
            anchors.right: parent.right
            text: "Ryza papieru"
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right

        Text {
            id: partsLabel
            anchors.left: parent.left
            text: "Składowe:"
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter
        }

        Text{
            id:destinyLabel
            anchors.right: parent.right
            text: "Typ odpadu:"
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        color: "yellow"

        Text {
            id: part1
            anchors.left: parent.left
            text: "Opakowanie"
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter
        }

        Text{
            id:destinyPart1
            anchors.right: parent.right
            text: "Plastik"
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        color: "blue"

        Text {
            id: part2
            anchors.left: parent.left
            text: "Kartki"
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter
        }

        Text{
            id:destinyPart2
            anchors.right: parent.right
            text: "Papier"
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
