import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

import ToDo 1.0

ApplicationWindow {
    id: main
    visible: true
    width: 324
    height: 692
    title: qsTr("Hello World")

    Material.theme: Material.Dark
    Material.accent: Material.Blue


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
                Layout.leftMargin: 1
                placeholderText: qsTr("  Enter name")
            }

            Button {
                id: addButton
                text: "Add Item"
                Layout.rightMargin: 10
             }
        }

        ListView
        {
            clip: true
            model: ToDoModel{
                list: toDoList
            }
            Layout.fillHeight: true
            Layout.fillWidth: true

            delegate: RowLayout{
                anchors.left: parent.left
                anchors.right: parent.right

                Text {
                    text: model.description
                    font.pointSize: 14
                    color: "white"
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                }

                Button {
                    text: "Remove"
                    Layout.rightMargin: 10
                }
            }
        }

    }
}

