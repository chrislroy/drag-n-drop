import QtQuick 2.0

Rectangle {
    id: item
//    color: "#404040"

    Component.onCompleted : {
        console.log("TreeDelegate in completed:", model.id)
    }

    Text {
        id: text
        anchors.fill: parent
        color: "#000000"
        elide: styleData.elideMode
        text: styleData.value

        font.family: "Fira Sans SemiBold"
        font.pixelSize: hifi.fontSizes.textFieldInput
        height: hifi.dimensions.tableRowHeight
    }

    DropArea {
        id: dropArea
        anchors.fill: parent
        keys: ["text/plain"]
        onEntered: console.log('onEntered:', styleData.value);
        onDropped: {
            console.log('onDropped', drop.text);
            theModel.updateModel(drop.text, styleData.value);
//            sceneView.sendToScript({
//                method: "reparent" ,
//                params: { child: drop.text, parent: model.id }
//            });
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        drag.target: draggable
        onClicked: {
//            sceneView.sendToScript({
//                method: "selection" ,
//                params: { selection: model.id }
//            });
        }
    }

    Item {
        id: draggable
        anchors.fill: parent
        Drag.active: mouseArea.drag.active
        Drag.hotSpot.x: 0
        Drag.hotSpot.y: 0
        Drag.mimeData: { "text/plain": styleData.value }
        Drag.dragType: Drag.Automatic
    }
}

//Rectangle {
//    id: item

//    Text {
//        id: text
//        anchors.fill: parent
//        text: styleData.value.text ? styleData.value.text : ""
//    }

//    DropArea {
//        id: dropArea
//        anchors.fill: parent
//        keys: ["text/plain"]
//        onEntered: console.log('onEntered');
//        onDropped: console.log('onDrop:', drop.text)
//    }

//    MouseArea {
//        id: mouseArea
//        anchors.fill: parent
//        drag.target: draggable
//    }

//    Item {
//        id: draggable
//        anchors.fill: parent
//        Drag.active: mouseArea.drag.active
//        Drag.hotSpot.x: 0
//        Drag.hotSpot.y: 0
//        Drag.mimeData: { "text/plain": text.text }
//        Drag.dragType: Drag.Automatic
//    }
//}

