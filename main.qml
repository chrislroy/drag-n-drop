import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2

ApplicationWindow {
    id: root
    visible: true
    title: qsTr("Simple Tree View")

//        DropArea {
//            id: mainMouseArea
////            anchors.fill: parent
////            onEntered: console.log("dnd entered ", drag.source.text)
////            onExited: console.log("dnd exited ", drag.source.text)
////            onDropped: console.log("dropped ", drag.source.text)
////            onPositionChanged: {
////                //drag.accept()
////                console.log("Position ", drag.x, drag.y)
////            }
//        }

    TreeView {
        id: treeview
        anchors.fill: parent
        model: theModel
        itemDelegate: TreeDelegate {}

        TableViewColumn {
            role: "title"
            title: "Title"
        }

        TableViewColumn {
            role: "summary"
            title: "Summary"
        }
    }


}
