import QtQuick 2.15

Row{
    id: rootSingleRow
    spacing: 8
    Image {
        id: nn
        source: "qrc:/icon/statistics_ic.svg"
        height: 15
        width: 15
    }
    Text {
        id: ff
        text: qsTr("Statistics")
        font.bold: true
        color: "#717485"
    }
}
