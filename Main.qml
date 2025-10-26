import QtQuick

Window {
    id: root
    width: 600
    height: 600
    color: "white"
    visible: true

    GridBackground {
        id: background
        anchors.fill: parent
    }

    CustomRect {
        id: rect1
        x: 0
        y: 50
    }

    Repeater {
        model: diagramDocument.model
        delegate: Rectangle {
            width: 80; height: 50
            color: "lightblue"
            x: position.x
            y: position.y
            border.color: "#888"
            radius: 6

            Text {
                anchors.centerIn: parent
                text: type
            }
        }
    }
}
