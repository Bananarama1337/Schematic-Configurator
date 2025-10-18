import QtQuick

Item {
    id: root
    anchors.fill: parent

    property color backgroundColor: "white"
    property color gridColor: "#e0e0e0"
    property int gridSize: 50
    property real gridLineWidth: 1
    property bool showGrid: true

    // Background Color
    Rectangle {
        anchors.fill: parent
        color: root.backgroundColor
    }

    // Grid
    Canvas {
        id: gridCanvas
        anchors.fill: parent
        visible: root.showGrid

        onPaint: {
            if (!visible) return;

            var ctx = getContext("2d")
            ctx.strokeStyle = root.gridColor
            ctx.lineWidth = root.gridLineWidth

            // Vertical lines
            for (var x = 0; x <= width; x += root.gridSize) {
                ctx.beginPath()
                ctx.moveTo(x, 0)
                ctx.lineTo(x, height)
                ctx.stroke()
            }

            // Horizontal lines
            for (var y = 0; y <= height; y += root.gridSize) {
                ctx.beginPath()
                ctx.moveTo(0, y)
                ctx.lineTo(width, y)
                ctx.stroke()
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Clicked on window background")
            forceActiveFocus()
        }
    }
}
