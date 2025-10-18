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

    CustomRect {
        id: rect2
        x: 200
        y: 50
    }

    CustomRect {
        id: rect3
        x: 400
        y: 50
    }
}
