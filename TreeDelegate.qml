import QtQuick 2.0
import hvoigt.net 1.0

Rectangle {
    id: item

    Text {
        id: text
        anchors.fill: parent
        text: styleData.value.text ? styleData.value.text : ""
    }

    DropArea {
        id: dropArea
        anchors.fill: parent
        keys: ["text/plain"]
        onEntered: console.log('onEntered');
        onDropped: console.log('onDrop:', drop.text)
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        drag.target: draggable
    }

    Item {
        id: draggable
        anchors.fill: parent
        Drag.active: mouseArea.drag.active
        Drag.hotSpot.x: 0
        Drag.hotSpot.y: 0
        Drag.mimeData: { "text/plain": text.text }
        Drag.dragType: Drag.Automatic
    }
}

