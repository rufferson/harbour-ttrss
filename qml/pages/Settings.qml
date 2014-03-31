import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property alias url: url.text
    property alias user: user.text
    property alias pass: pass.text
    property alias dlim: dlim.checked
    property alias svpw: svpw.checked
    property alias txsz: txtSize.value
    DialogHeader {
        acceptText: "Save"
        cancelText: "Cancel"
    }
    Column {
        width: parent.width
        anchors.centerIn: parent

        Label { text: "TT-RSS API URL"}
        TextField {
            id: url
            placeholderText: "https://www.example.com/tt-rss/api/"
            EnterKey.enabled: text.length > 0
            EnterKey.onClicked: user.focus = true
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            width: parent.width
        }
        Label {text:"User Name"}
        TextField {
            id:user
            placeholderText: 'Login'
            EnterKey.enabled: text.length > 0
            EnterKey.onClicked: pass.focus = true
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            width: parent.width
        }
        Label {text:"Password"}
        TextField {
            id:pass
            echoMode: TextInput.PasswordEchoOnEdit
            placeholderText: 'Password'
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
    }
}
