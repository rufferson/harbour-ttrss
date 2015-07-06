import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: page
    //anchors.fill: parent
    DialogHeader {
        id: cTitle
    }
    Label {
        id: cMessage
        anchors.centerIn: parent
        //text: "Alert!"
    }
    property alias title: cTitle.acceptText
    property alias message: cMessage.text
}
