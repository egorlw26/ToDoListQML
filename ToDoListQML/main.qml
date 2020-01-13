import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    visible: true
    width: 320
    height: 640
    title: qsTr("Hello World")

    Material.theme: Material.Dark
    Material.accent: Material.Blue


    ListModel{
        id: tmodel
        ListElement{
            text: "Test1"
        }
        ListElement{
            text: "Test2"
        }
    }

    ColumnLayout
    {
        spacing: 1
        anchors.fill: parent

        RowLayout {
            spacing: 1
            Layout.alignment: Qt.AlignTop
            TextField {
                id: enterField
                Layout.fillWidth: true
                placeholderText: qsTr("Enter name")
            }

            Button {
                id: addButton
                text: "Add Item"
             }
        }

        ListView
        {
            id: listView
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: tmodel
            delegate: RowLayout {
                Layout.fillWidth: true

                Text {
                    Layout.fillWidth: true
                    text: model.text
                    color: "grey"
                    font.pointSize: 16
                }

                Rectangle{
                    Layout.alignment: Qt.AlignRight
                    width: 10
                    height: 10
                    color: "blue"
                }
            }

        }
    }
}

