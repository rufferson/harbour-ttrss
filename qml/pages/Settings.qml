import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property alias url: url.text
    property alias user: user.text
    property alias pass: pass.text
    property alias dlim: dlim.checked
    property alias svpw: svpw.checked
    property alias txsz: txtSize.value
    property alias alor: orient.value
    anchors.fill: parent
    canAccept: (url.text && user.text && pass.text)
    Column {
        width: parent.width
        //anchors.centerIn: parent
        DialogHeader {
            acceptText: "Save"
            cancelText: "Cancel"
        }

        TextField {
            id: url
            placeholderText: "https://www.example.com/tt-rss"
            label: "TT-RSS Application URL"
            EnterKey.enabled: text.length > 0
            EnterKey.onClicked: user.focus = true
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            width: parent.width
        }
        TextField {
            id:user
            placeholderText: 'Login'
            label: "User Name"
            EnterKey.enabled: text.length > 0
            EnterKey.onClicked: pass.focus = true
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            width: parent.width
        }
        TextField {
            id:pass
            echoMode: TextInput.PasswordEchoOnEdit
            placeholderText: 'Password'
            label: "User Password"
            EnterKey.enabled: text.length > 0
            EnterKey.onClicked: parent.parent.accept()
            width: parent.width
        }
        TextSwitch {
            id: svpw
            text: "Save Password"
        }
        TextSwitch {
            id: dlim
            text: "Pre-cache Images"
            visible: false // meaningless for light ver
        }
        Slider {
            id: txtSize
            width: parent.width
            minimumValue: Theme.fontSizeTiny
            maximumValue: Theme.fontSizeMedium
            stepSize: 4
            valueText: ['Tiny','Small','Medium','Large'][(value-20)/4]
            label: 'Text Size'
        }
        Slider {
            id: orient
            width: parent.width
            minimumValue: 0
            maximumValue: 2
            stepSize: 1
            valueText: ['Portrait','Landscape','Both'][value]
            label: 'Allowed Orientation'
        }
    }
}
