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
        border.width: 2
        radius: 5

        property real minWidth: 50
        property real maxWidth: 400
        property real minHeight: 50
        property real maxHeight: 300
        property real minX: 0
        property real maxX: 500
        property real minY: 0
        property real maxY: 400
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
                    console.log("Hovering over the topLeftResizer")
                    cursorShape = Qt.SizeFDiagCursor
                }

                onExited: {
                    console.log("Hover left the topLeftResizer")
                    cursorShape = Qt.ArrowCursor
                }

                onPressed: {
                    console.log("topLeftResizer pressed")
                }

                onPositionChanged: {
                    if (pressed) {
                        var newWidth = mainRectangle.width - mouseX;
                        var newHeight = mainRectangle.height - mouseY;

                        mainRectangle.width = clamp(newWidth, mainRectangle.minWidth, mainRectangle.maxWidth);
                        mainRectangle.height = clamp(newHeight, mainRectangle.minHeight, mainRectangle.maxHeight);

                        if (newWidth >= mainRectangle.minWidth && newWidth <= mainRectangle.maxWidth) {
                            mainRectangle.x += mouseX;
                        }
                        if (newHeight >= mainRectangle.minHeight && newHeight <= mainRectangle.maxHeight) {
                            mainRectangle.y += mouseY;
                        }
                    }
                }
            }
        }

        Rectangle {
            id: bottomLeftResizer
            width: 12
            height: 12
            radius: 12
            visible: mainRectangle.isSelected
            anchors.horizontalCenter: mainRectangle.left
            anchors.verticalCenter: mainRectangle.bottom
            color: "lightblue"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: false

                onEntered: {
                    console.log("Hovering over the bottomLeftResizer")
                    cursorShape = Qt.SizeBDiagCursor
                }

                onExited: {
                    console.log("Hover left the bottomLeftResizer")
                    cursorShape = Qt.ArrowCursor
                }

                onPressed: {
                    console.log("bottomLeftResizer pressed")
                }

                onPositionChanged: {
                    if (pressed) {
                        var newWidth = mainRectangle.width - mouseX;
                        var newHeight = mainRectangle.height + mouseY;

                        mainRectangle.width = clamp(newWidth, mainRectangle.minWidth, mainRectangle.maxWidth);
                        mainRectangle.height = clamp(newHeight, mainRectangle.minHeight, mainRectangle.maxHeight);

                        if (newWidth >= mainRectangle.minWidth && newWidth <= mainRectangle.maxWidth) {
                            mainRectangle.x += mouseX;
                        }
                    }
                }
            }
        }

        Rectangle {
            id: topRightResizer
            width: 12
            height: 12
            radius: 12
            visible: mainRectangle.isSelected
            anchors.horizontalCenter: mainRectangle.right
            anchors.verticalCenter: mainRectangle.top
            color: "lightblue"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: false

                onEntered: {
                    console.log("Hovering over the topRightResizer")
                    cursorShape = Qt.SizeBDiagCursor
                }

                onExited: {
                    console.log("Hover left the topRightResizer")
                    cursorShape = Qt.ArrowCursor
                }

                onPressed: {
                    console.log("topRightResizer pressed")
                }

                onPositionChanged: {
                    if (pressed) {
                        var newWidth = mainRectangle.width + mouseX;
                        var newHeight = mainRectangle.height - mouseY;

                        mainRectangle.width = clamp(newWidth, mainRectangle.minWidth, mainRectangle.maxWidth);
                        mainRectangle.height = clamp(newHeight, mainRectangle.minHeight, mainRectangle.maxHeight);

                        if (newHeight >= mainRectangle.minHeight && newHeight <= mainRectangle.maxHeight) {
                            mainRectangle.y += mouseY;
                        }
                    }
                }
            }
        }

        Rectangle {
            id: bottomRightResizer
            width: 12
            height: 12
            radius: 12
            visible: mainRectangle.isSelected
            anchors.horizontalCenter: mainRectangle.right
            anchors.verticalCenter: mainRectangle.bottom
            color: "lightblue"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: false

                onEntered: {
                    console.log("Hovering over the bottomRightResizer")
                    cursorShape = Qt.SizeFDiagCursor
                }

                onExited: {
                    console.log("Hover left the bottomRightResizer")
                    cursorShape = Qt.ArrowCursor
                }

                onPressed: {
                    console.log("bottomRightResizer pressed")
                }

                onPositionChanged: {
                    if (pressed) {
                        var newWidth = mainRectangle.width + mouseX;
                        var newHeight = mainRectangle.height + mouseY;

                        mainRectangle.width = clamp(newWidth, mainRectangle.minWidth, mainRectangle.maxWidth);
                        mainRectangle.height = clamp(newHeight, mainRectangle.minHeight, mainRectangle.maxHeight);
                    }
                }
            }
        }

        Rectangle {
            id: topHeightResizer
            width: 12
            height: 12
            radius: 12
            visible: mainRectangle.isSelected
            anchors.horizontalCenter: mainRectangle.horizontalCenter
            anchors.verticalCenter: mainRectangle.top
            color: "lightblue"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: false

                onEntered: {
                    console.log("Hovering over the topHeightResizer")
                    cursorShape = Qt.SizeVerCursor
                }

                onExited: {
                    console.log("Hover left the topHeightResizer")
                    cursorShape = Qt.ArrowCursor
                }

                onPressed: {
                    console.log("topHeightResizer pressed")
                }

                onPositionChanged: {
                    if (pressed) {
                        var newHeight = mainRectangle.height - mouseY;
                        mainRectangle.height = clamp(newHeight, mainRectangle.minHeight, mainRectangle.maxHeight);

                        if (newHeight >= mainRectangle.minHeight && newHeight <= mainRectangle.maxHeight) {
                            mainRectangle.y += mouseY;
                        }
                    }
                }
            }
        }

        Rectangle {
            id: bottomHeightResizer
            width: 12
            height: 12
            radius: 12
            visible: mainRectangle.isSelected
            anchors.horizontalCenter: mainRectangle.horizontalCenter
            anchors.verticalCenter: mainRectangle.bottom
            color: "lightblue"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: false

                onEntered: {
                    console.log("Hovering over the bottomHeightResizer")
                    cursorShape = Qt.SizeVerCursor
                }

                onExited: {
                    console.log("Hover left the bottomHeightResizer")
                    cursorShape = Qt.ArrowCursor
                }

                onPressed: {
                    console.log("bottomHeightResizer pressed")
                }

                onPositionChanged: {
                    if (pressed) {
                        var newHeight = mainRectangle.height + mouseY;
                        mainRectangle.height = clamp(newHeight, mainRectangle.minHeight, mainRectangle.maxHeight);
                    }
                }
            }
        }

        Rectangle {
            id: leftWidthResizer
            width: 12
            height: 12
            radius: 12
            visible: mainRectangle.isSelected
            anchors.horizontalCenter: mainRectangle.left
            anchors.verticalCenter: mainRectangle.verticalCenter
            color: "lightblue"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: false

                onEntered: {
                    console.log("Hovering over the leftWidthResizer")
                    cursorShape = Qt.SizeHorCursor
                }

                onExited: {
                    console.log("Hover left the leftWidthResizer")
                    cursorShape = Qt.ArrowCursor
                }

                onPressed: {
                    console.log("leftWidthResizer pressed")
                }

                onPositionChanged: {
                    if (pressed) {
                        var newWidth = mainRectangle.width - mouseX;

                        mainRectangle.width = clamp(newWidth, mainRectangle.minWidth, mainRectangle.maxWidth);

                        if (newWidth >= mainRectangle.minWidth && newWidth <= mainRectangle.maxWidth) {
                            mainRectangle.x += mouseX;
                        }
                    }
                }
            }
        }

        Rectangle {
            id: rightWidthResizer
            width: 12
            height: 12
            radius: 12
            visible: mainRectangle.isSelected
            anchors.horizontalCenter: mainRectangle.right
            anchors.verticalCenter: mainRectangle.verticalCenter
            color: "lightblue"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: false

                onEntered: {
                    console.log("Hovering over the rightWidthResizer")
                    cursorShape = Qt.SizeHorCursor
                }

                onExited: {
                    console.log("Hover left the rightWidthResizer")
                    cursorShape = Qt.ArrowCursor
                }

                onPressed: {
                    console.log("rightWidthResizer pressed")
                }

                onPositionChanged: {
                    if (pressed) {
                        var newWidth = mainRectangle.width + mouseX;
                        mainRectangle.width = clamp(newWidth, mainRectangle.minWidth, mainRectangle.maxWidth);
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

    function clamp(value, min, max) {
            return Math.max(min, Math.min(max, value))
        }
}
