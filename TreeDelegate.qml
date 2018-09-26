import QtQuick 2.0
import hvoigt.net 1.0

Item {

//    Rectangle {
//        id: textRect
//        anchors.fill: text
//        color: "red"
//    }

    Text {
        id: text
        anchors.fill: parent
        color: "black"
        elide: styleData.elideMode
        text: styleData.value.text ? styleData.value.text : ""

        Drag.active: dragArea.drag.active
        Drag.hotSpot.x: 10
        Drag.hotSpot.y: 10
    }

    MouseArea {
        id: dragArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton

        // onClicked: { console.log("clicked ", styleData.value.text ); }
        hoverEnabled: true
        //onEntered: { text.color = "yellow" }
        //onExited: { text.color = "red" }

        drag.target: text
    }

}
