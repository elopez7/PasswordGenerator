import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.esteban.password

ApplicationWindow {
    width: 1280
    height: 960
    visible: true
    title: qsTr("Password Generator")
    color: "#131218"

    Password{
        id: passwordGenerator
    }

    Rectangle {
        id: passwordBackground
        height: 186
        color: "#24232b"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 128
        anchors.leftMargin: 128
        anchors.topMargin: 23

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            layoutDirection: Qt.LeftToRight
            spacing: 5

            Text {
                id: text1
                color: "#e3e2e7"
                text: passwordGenerator.password
                font.pixelSize: 48
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                Layout.leftMargin: 0
                font.bold: true
                Layout.preferredHeight: 28
                Layout.preferredWidth: 100
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Button {
                id: button1
                text: qsTr("Copy")
                icon.color: "#000000"
                display: AbstractButton.IconOnly
                icon.source: "qrc:/image/copy.png"
            }
        }
    }

    Rectangle {
        id: controlsBackground
        color: "#24232b"
        anchors.left: passwordBackground.left
        anchors.right: passwordBackground.right
        anchors.top: passwordBackground.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 48
        anchors.topMargin: 24
        anchors.rightMargin: 0

        ColumnLayout {
            id: columnLayout
            anchors.fill: parent
            anchors.rightMargin: 16
            anchors.leftMargin: 16

            RowLayout {
                id: rowLayout1
                width: 100
                height: 100
                Layout.fillHeight: true
                Layout.preferredWidth: 384
                Layout.fillWidth: true

                Text {
                    id: text2
                    color: "#e3e2e7"
                    text: qsTr("Character Length")
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    Layout.fillHeight: true
                    font.bold: true
                    Layout.preferredWidth: 190
                    Layout.fillWidth: true
                }

                Text {
                    id: characterLengthText
                    color: "#e3e2e7"
                    text: passwordGenerator.passwordLength
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    Layout.fillHeight: true
                    font.bold: true
                    Layout.preferredWidth: 190
                    Layout.fillWidth: true
                }
            }

            Slider {
                id: passwordLengthSlider
                Layout.fillHeight: true
                Layout.fillWidth: true
                stepSize: 1
                to: 20
                from: 5
                value: 5
                onValueChanged: {
                    passwordGenerator.passwordLength = passwordLengthSlider.value

                }
            }

            CheckBox {
                id: upperCase
                text: qsTr("Use Uppercase Characters")
                font.pointSize: 24
                font.bold: true
                Layout.preferredWidth: 384
                Layout.fillWidth: true
                onCheckedChanged: {
                    passwordGenerator.useUpperCase = upperCase.checked

                }
            }

            CheckBox {
                id: lowerCase
                text: qsTr("Use Lowercase Characters")
                font.pointSize: 24
                font.bold: true
                Layout.fillHeight: true
                Layout.preferredWidth: 384
                Layout.fillWidth: true
                onCheckedChanged: {
                    passwordGenerator.useLowerCase = lowerCase.checked

                }
            }

            CheckBox {
                id: numbers
                text: qsTr("Use Numbers")
                font.pointSize: 24
                font.bold: true
                Layout.fillHeight: true
                Layout.preferredWidth: 384
                Layout.fillWidth: true
                onCheckedChanged: {
                    passwordGenerator.useNumbers = numbers.checked

                }
            }

            CheckBox {
                id: specialCharacters
                text: qsTr("Use Special Characters")
                font.pointSize: 24
                font.bold: true
                Layout.fillHeight: true
                Layout.preferredWidth: 384
                Layout.fillWidth: true
                onCheckedChanged: {
                    passwordGenerator.useSpecialCharacters = specialCharacters.checked

                }
            }
            Button {
                id: button
                text: qsTr("Generate Password")
                Layout.topMargin: 64
                Layout.margins: 32
                Layout.fillHeight: true
                font.pointSize: 24
                Layout.fillWidth: true
                onClicked: {
                    passwordGenerator.makeAlphabet();
                }
            }
        }
    }
}
