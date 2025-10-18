import QtQuick

Item {
    implicitWidth: mainRectangle.width
    implicitHeight: mainRectangle.height

    Rectangle {
        id: mainRectangle
        focus: true
        width: 150
        height: 75
        border.color: "black"
        border.width: isSelected ? 2 : 4
        //radius: 5
        property bool isSelected : false
        property bool isPressed : false

        Rectangle {
            id: topLeftResizer
            width: 12
            height: 12
            radius: 12
            visible: mainRectangle.isSelected
            anchors.horizontalCenter: mainRectangle.left
            anchors.verticalCenter: mainRectangle.top
            color: "lightblue"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: false

                onEntered: {
                    console.log("Hovering over the rectangle")
                    cursorShape = Qt.SizeFDiagCursor
                }

                onExited: {
                    console.log("Hover left the rectangle")
                    cursorShape = Qt.ArrowCursor
                }

                onPressed: {
                    console.log("Resizer pressed")
                }

                onPositionChanged: {
                    if (pressed) {
                        mainRectangle.width -= mouseX
                        mainRectangle.x += mouseX

                        mainRectangle.height -= mouseY
                        mainRectangle.y += mouseY
                    }
                }
            }
        }

        TextInput {
            id: rectText
            text: "Test"
            font.pixelSize: 14
            anchors {
                centerIn: parent
            }
        }

        MouseArea {
            id: mainMouseArea
            anchors.margins: 1
            propagateComposedEvents: true
            anchors.fill: parent

            drag.target: mainRectangle
            drag.axis: Drag.XAndYAxis
            drag.minimumX: 0
            drag.minimumY: 0
            hoverEnabled: true

            onClicked: {
                console.log("clicked")
                mainRectangle.isSelected = true
            }

            onDoubleClicked: {
                console.log("double clicked - focusing text")
                rectText.forceActiveFocus()
                rectText.selectAll()
            }

            onPressed: {
                console.log("pressed")
                mainRectangle.isPressed = true
                mainRectangle.forceActiveFocus()
            }

            onEntered: {
                console.log("Hovering over the rectangle")
                cursorShape = Qt.SizeAllCursor
            }

            onExited: {
                console.log("Hover left the rectangle")
                cursorShape = Qt.ArrowCursor
            }
        }

        onActiveFocusChanged: {
            console.log("Rectangle focus:", activeFocus)
            if (!activeFocus && !rectText.activeFocus) {
                isSelected = false
            }
        }
    }

    function resetFocus() {
        mainRectangle.focus = false
        rectText.focus = false
        mainRectangle.isSelected = false
    }
}
