import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

import ToDo 1.0

ApplicationWindow {
    id: main
    visible: true
    width: maximumHeight
    height: maximumWidth

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
                Layout.margins: 10
                font.pointSize: 16
                placeholderText: qsTr("Enter name")
            }

            Button {
                id: addButton
                text: "Add Item"
                onClicked: {
                    toDoList.addItem(enterField.text)
                    toDoList.saveList()
                    enterField.clear()
                }
                Layout.rightMargin: 10
             }
        }

        ListView
        {
            id: listView
            clip: true
            model: ToDoModel{
                list: toDoList
            }
            Layout.fillHeight: true
            Layout.fillWidth: true

            delegate: RowLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                Layout.margins: 10

                CheckBox
                {
                    Layout.leftMargin: 15
                    checked: model.complete
                    onClicked: {
                        model.complete = checked
                        toDoList.saveList()
                    }
                }

                Text {
                    text: model.description
                    font.pointSize: 18
                    color: "white"
                    Layout.fillWidth: true
                }
            }
        }

        Button {
            text: "Remove Completed"
            onClicked: {
                toDoList.removeCompletedItems()
                toDoList.saveList()
            }
            Layout.fillWidth: true
            Layout.margins: 10
        }

    }
}

