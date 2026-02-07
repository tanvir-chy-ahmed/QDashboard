import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtCharts

ApplicationWindow{
    id: root
    width: 1100
    height: 610
    minimumHeight: 400
    minimumWidth: 600
    visible: true
    title: qsTr("Dashboard")
    flags: Qt.FramelessWindowHint | Qt.Window
    visibility: Window.Windowed

    // 🔢 Raw input value (0–100)
    property int rawValue: 50


    Rectangle {
        id: titleBar
        height: 40
        width: parent.width
        color: "#1E2130"



        MouseArea {
            anchors.fill: parent

            onPressed: root.startSystemMove()
        }

        RowLayout {
            anchors.fill: parent
            anchors.margins: 10

            Text {
                text: "Dashboard"
                color: "white"
                font.bold: true
                font.pointSize: 16
                anchors.verticalCenter: parent.verticalCenter

            }

            Item { Layout.fillWidth: true }

            Rectangle {
                width: 30
                height: 30
                radius: 4
                color: "#4ECDC4"

                MouseArea {
                    anchors.fill: parent
                    onClicked: root.showMinimized()
                }

                Text {
                    anchors.centerIn: parent
                    text: "-"
                    color: "black"
                }
            }

            Rectangle {
                width: 30
                height: 30
                radius: 4
                color: "#FFD93D"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (root.visibility === Window.Maximized)
                            root.showNormal()
                        else
                            root.showMaximized()
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "⬜"
                    color: "black"
                }
            }

            Rectangle {
                width: 30
                height: 30
                radius: 4
                color: "#FF6B6B"

                MouseArea {
                    anchors.fill: parent
                    onClicked: Qt.quit()
                }

                Text {
                    anchors.centerIn: parent
                    text: "X"
                    color: "white"
                }
            }
        }
    }




    Rectangle{

        anchors {
            top: titleBar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        height: root.height
        width: root.width
        color: "#1d1f2b"

        // Left Widget
        Rectangle{
            id: leftWidget
            width: root.width / 3.5
            color:"#303346"
            radius: 15
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
                margins: 10
                bottomMargin: 10
            }

            ColumnLayout {
                width: leftWidget.width
                spacing: 8
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Item {
                    height: 20
                }


                // Circle user Profile
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: imgCircle
                    height: 60
                    width: 60
                    color: "#ff252837"
                    radius: 30   // half of height/width

                    Image {
                        anchors.centerIn: parent
                        height: imgCircle.height / 2
                        width: imgCircle.width / 2
                        source: "qrc:/icon/user_ic.svg"
                    }
                }


                ColumnLayout{
                    Layout.alignment:  Qt.AlignHCenter
                    Text {
                        id: userName
                        text: qsTr("Tanvir Chowdhury")
                        color: "#f1f3fe"
                        font.bold: true
                        font.pointSize: 14
                    }

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        id: subname
                        text: qsTr("Software Developer")
                        color: "gray"
                        font.bold: true
                        font.pointSize: 9
                    }

                }



                Item{
                    height: 50
                }


                ColumnLayout{
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 25

                    SingleRow{
                        imgpath: "qrc:/icon/triangle_ic.svg"
                        name: "Project"
                    }


                    SingleRow{

                        imgpath: "qrc:/icon/statistics_ic.svg"
                        name: "Statistics"
                    }



                    SingleRow{

                        imgpath: "qrc:/icon/star_ic.svg"
                        name: "Media"
                    }



                    SingleRow{

                        imgpath: "qrc:/icon/dashboard_ic.svg"
                        name: "Dashboard"
                    }




                    SingleRow{

                        imgpath: "qrc:/icon/report_ic.svg"
                        name: "Reports"
                    }


                    SingleRow{

                        imgpath: "qrc:/icon/setting_ic.svg"
                        name: "Settings"
                    }
                }










            }


        }



        // Right Side

        Rectangle{
            id: rightWidget
            color: "#1d1f2b"

            anchors{
                top: parent.top
                bottom: parent.bottom
                right: parent.right
                left: leftWidget.right
            }

            ColumnLayout{
                anchors.fill: parent
                anchors.margins: 20


                RowLayout{
                    spacing: 16



                    ColumnLayout{
                        Layout.fillWidth: true
                        spacing: 4
                        Text {
                            text: "Dashboard Content"
                            color: "#f1f3fe"
                            font.pointSize: 16
                            font.bold: true
                        }
                        Text {

                            text: "Welcome to Xorin Dashboard"
                            color: "gray"
                            font.pointSize: 8
                            font.bold: true
                        }



                    }

                    Item {
                        Layout.fillWidth: true
                    }


                    Rectangle {
                        id: searchBox
                        implicitWidth: 240
                        implicitHeight: 50
                        radius: 8
                        color: "#ffffff"
                        border.color: "#d0d0d0"
                        border.width: 1


                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 8
                            spacing: 6

                            TextField {
                                id: txtField
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                placeholderText: qsTr("Search")
                                background: null
                                padding: 0
                            }

                            Image {
                                source: "qrc:/icon/search_ic.svg"
                                Layout.preferredWidth: 18
                                Layout.preferredHeight: 18
                                fillMode: Image.PreserveAspectFit
                                opacity: 0.6
                            }
                        }
                    }
                }


                Item{ height: 30 }




                Rectangle{

                    color: "#252837"
                    Layout.fillWidth: true
                    height: 250
                    radius: 12

                    ColumnLayout{
                        anchors.fill: parent
                        anchors.margins: 20
                        Text {
                            text: "List Data"
                            color: "#f1f3fe"
                            font.pointSize: 16
                            font.bold: true
                        }







                        CustomPrg{
                            id: bar1
                            progressColor: "#715ec8"
                            text: "Lorem ipsum"
                            value: to * 0.5
                        }

                        CustomPrg{
                            id: bar2
                            progressColor: "#6ee0d8"
                            text: "Dolor"
                            value: to * 0.4
                        }

                        CustomPrg{
                            id: bar3
                            progressColor: "#ff6694"
                            text: "Sit Amet"
                            value: to * 0.3
                        }


                        CustomPrg {
                            id: bar4
                            progressColor: "#feb845"
                            text: "Consectetuer"
                            value: to * 0.2
                        }

                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                bar1.value = Math.min(bar1.value + 15, bar1.to)
                                bar2.value = Math.min(bar2.value + 15, bar2.to)
                                bar3.value = Math.min(bar3.value + 15, bar3.to)
                                bar4.value = Math.min(bar4.value + 15, bar4.to)
                            }
                        }






                    }



                }








                Item{
                    height: 20
                }

                RowLayout{
                    anchors.margins: 20
                    spacing: 20


                    Rectangle {
                        color: "#252837"
                        width: 380
                        Layout.fillHeight: true
                        radius: 12



                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 10

                            ColumnLayout {
                                Text { text: "Component"; color: "#f1f3fe"; font.bold: true }
                                Text { text: "Temperature Sensor"; color: "#FF6B6B";  }   // red-pink
                                Text { text: "Motor Controller"; color: "#4ECDC4";  }      // teal
                                Text { text: "Power Supply"; color: "#FFD93D";  }          // yellow
                                Text { text: "Display Unit"; color: "#1A535C";  }          // dark teal
                                Text { text: "Communication Module"; color: "#FF6B6B";  } // red-pink
                            }

                            ColumnLayout {
                                Text { text: "Last Update"; color: "#f1f3fe"; font.bold: true }
                                Text { text: "12:05:21"; color: "#A29BFE";  }  // purple
                                Text { text: "12:04:59"; color: "#55E6C1";  }  // aqua
                                Text { text: "12:05:10"; color: "#FF9F1C";  }  // orange
                                Text { text: "12:05:00"; color: "#2ED573";  }  // green
                                Text { text: "12:05:15"; color: "#FFA69E";  }  // soft pink
                            }

                            ColumnLayout {
                                Text { text: "Status"; color: "#f1f3fe"; font.bold: true }
                                Text { text: "OK"; color: "#2ED573"; font.bold: true }       // green
                                Text { text: "OK"; color: "#2ED573"; font.bold: true }       // green
                                Text { text: "Warning"; color: "#FF9F1C"; font.bold: true }  // orange
                                Text { text: "OK"; color: "#2ED573"; font.bold: true }       // green
                                Text { text: "Active"; color: "#6C5CE7"; font.bold: true }   // violet
                            }

                            ColumnLayout {
                                Text { text: "Value"; color: "#f1f3fe"; font.bold: true }
                                Text { text: "36°C"; color: "#FF6B6B";  }          // red
                                Text { text: "1500 RPM"; color: "#4ECDC4";  }     // teal
                                Text { text: "12.2 V"; color: "#FFD93D";  }       // yellow
                                Text { text: "On"; color: "#1A535C"; font.bold: true }   // dark teal
                                Text { text: "UART Active"; color: "#FF6B6B"; font.bold: true } // red-pink
                            }
                        }


                    }


                    Item{
                        width: 20
                    }

                    Rectangle{
                        id: box
                        width: 380
                        height: 100
                        color: "#252837"
                        radius: 12
                        Layout.fillHeight: true
                        RowLayout{
                            anchors.fill: parent
                            anchors.margins: 16
                            spacing: 8

                            // Title column
                            ColumnLayout {
                                spacing: 4
                                Layout.fillWidth: true
                                Layout.alignment: Qt.AlignVCenter

                                Text {
                                    text: "Earnings"
                                    color: "#AAAAAA"
                                    font.pointSize: 11
                                    font.bold: true
                                }

                                Text {
                                    text: "$12,450"
                                    color: "#FFFFFF"
                                    font.pointSize: 20
                                    font.bold: true
                                }

                                Text {
                                    text: "+8% vs last month"
                                    color: "#4CD137" // green for positive growth
                                    font.pointSize: 10
                                }
                            }

                            // Mini Chart Placeholder
                            Canvas {
                                width: 100
                                height: 40
                                Layout.alignment: Qt.AlignVCenter

                                onPaint: {
                                    var ctx = getContext("2d");
                                    ctx.clearRect(0, 0, width, height);

                                    // Simple line chart example
                                    ctx.strokeStyle = "#FF6B6B";
                                    ctx.lineWidth = 2;
                                    ctx.beginPath();
                                    ctx.moveTo(0, height * 0.7);
                                    ctx.lineTo(width * 0.25, height * 0.5);
                                    ctx.lineTo(width * 0.5, height * 0.6);
                                    ctx.lineTo(width * 0.75, height * 0.3);
                                    ctx.lineTo(width, height * 0.4);
                                    ctx.stroke();
                                }
                            }
                            // Chart

                        }
                    }



                }
                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }



            }


        }




    }
}



















