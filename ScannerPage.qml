import QtQuick 2.12
import QtMultimedia 5.12
import QtQuick.Window 2.15
import com.scythestudio.scodes 1.0

Item {
    id: root
    visible: true
    width: Qt.platform.os == "android"
           || Qt.platform.os == "ios" ? Screen.width : camera.viewfinder.resolution.width
    height: Qt.platform.os == "android"
            || Qt.platform.os == "ios" ? Screen.height : camera.viewfinder.resolution.height

    Camera {
        id: camera
        focus {
            focusMode: CameraFocus.FocusContinuous
            focusPointMode: CameraFocus.FocusPointAuto
        }
    }

    VideoOutput {
        id: videoOutput
        source: camera
        anchors.fill: parent
        autoOrientation: true
        fillMode: VideoOutput.PreserveAspectCrop
        // add barcodeFilter to videoOutput's filters to enable catching barcodes
        filters: [barcodeFilter]

        onSourceRectChanged: {
            barcodeFilter.captureRect = videoOutput.mapRectToSource(
                        videoOutput.mapNormalizedRectToItem(Qt.rect(0.25, 0.25, 0.5, 0.5)))
        }

        ScannerOverlay {
            id: scannerOverlay
            anchors.fill: parent

            captureRect: videoOutput.mapRectToItem(barcodeFilter.captureRect)
        }

        // used to get camera focus on touched point
        MouseArea {
            anchors.fill: parent
            onClicked: {

                camera.focus.customFocusPoint = Qt.point(mouse.x / width,
                                                         mouse.y / height)
                camera.focus.focusMode = CameraFocus.FocusMacro
                camera.focus.focusPointMode = CameraFocus.FocusPointCustom
            }
        }
    }

    SBarcodeFilter {
        id: barcodeFilter

        // you can adjust capture rect (scan area) ne changing these Qt.rect() parameters
        captureRect: videoOutput.mapRectToSource(
                         videoOutput.mapNormalizedRectToItem(Qt.rect(0.25, 0.25,
                                                                     0.5, 0.5)))

        onCapturedChanged: {
            active = false
            console.log("captured: " + captured)
        }
    }

    Rectangle {
        anchors.fill: parent
        visible: !barcodeFilter.active
        gradient: Gradient {
            GradientStop { position: 1.0; color: "#1a2033" }
            GradientStop { position: 0.0; color: "#3a4055" }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 20

            Text {
                id: barcodeLabel
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Kod:" +barcodeFilter.captured
                color: "white"
            }

            ProduktCocaCola {
                id: produktCocaCola
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                visible: barcodeFilter.captured == 54491472
            }

            ProduktTiger {
                id: produktTiger
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                visible: barcodeFilter.captured == 5900334008206
            }

            ProduktPapierDoDrukarki {
                id: produktPapierDoDrukarki
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                visible: barcodeFilter.captured == 3141728704706
            }

            ProduktNieznany {
                id: produktNieznany
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                visible: barcodeFilter.captured != 5900334008206
                         && barcodeFilter.captured != 54491472
                         && barcodeFilter.captured != 3141728704706
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Zeskanuj ponownie")
                visible: !produktNieznany.visible
                radius: 3
                height: parent.height * 0.1

                onClicked: {
                    barcodeFilter.active = true
                }
            }
        }
    }

    Rectangle {
        id:searchBar
        height: 70
        anchors {
            bottom: backButton.top
            left: parent.left
            right: parent.right
            bottomMargin: 2
        }
        color: "#2c3e50"
        visible: produktNieznany.visible

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

    Button {
        id: backButton
        anchors.left: parent.left
        anchors.right: parent.right
        text: qsTr("Wstecz")
        height: parent.height * 0.08
        anchors.bottom: parent.bottom

        onClicked: {
            root.visible = false
            barcodeFilter.active = true
        }
    }
}
