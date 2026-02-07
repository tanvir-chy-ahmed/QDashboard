import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: root

    property string text: ""
    property color backgroundColor: "#2f3243"
    property color progressColor: "#feb845"
    property int radius: 10
    property real value: 0
    property real from: 0
    property real to: 750

    spacing: 15

    ProgressBar {
        id: bar
        from: root.from
        to: root.to
        value: root.value

        Layout.preferredWidth: 100  // 🔥 IMPORTANT
        Layout.preferredHeight: 10

        background: Rectangle {
            radius: root.radius
            color: root.backgroundColor
        }

        contentItem: Rectangle {
            radius: root.radius
            color: root.progressColor
            height: bar.height
            width: bar.position * bar.width
        }
    }

    Text {
        text: root.text
        font.pointSize: 10
        color: "white"
        verticalAlignment: Text.AlignVCenter
    }
}
