import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

RowLayout{

    property string imgpath;
    property string name;

    signal clicked();


    id: rootSingleRow
    spacing: 15
    height: 30
    width: 34

    Layout.alignment: Qt.AlignHCenter  // want to every item st


    Rectangle{
        id: bg
        anchors.fill: parent


        radius: 8
        color: mousearea.pressed ? "#ff7e7f" : mousearea.containsMouse
                                   ? "#1F2233" : "transparent"
    }

    Image {

        id: img
        source: imgpath
        height: 20
        width: 20
        fillMode: Image.PreserveAspectFit
    }
    Text {

        id: txtname
        font.pointSize: 10
        text: qsTr(name)
        font.bold: true
        color: "#717485"
    }


    MouseArea{
        id: mousearea
        hoverEnabled: true
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
}
