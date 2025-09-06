import io.calamares.ui 1.0
import io.calamares.core 1.0

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Rectangle {
    id: sideBar;

    SystemPalette {
        id: systemPalette
    }

    color: systemPalette.window;

    antialiasing: true

    Rectangle {
        anchors.fill: parent
        anchors.rightMargin: 35/2
        color: Branding.styleString(Branding.SidebarBackground)
    }

    ListView {
        id: list
        anchors.leftMargin: 12
        anchors.fill: parent
        model: ViewManager
        interactive: false
        spacing: 0
        delegate: RowLayout {
            visible: index!=0
            height: index==0?0:50
            width: parent.width

            Text {
                Layout.fillWidth: true
                fontSizeMode: Text.Fit
                color: Branding.styleString(Branding.SidebarText)
                text: display;
                font.pointSize : 12
                minimumPointSize: 5
                Layout.alignment: Qt.AlignLeft|Qt.AlignVCenter
                clip: true
            }
            Item {
                Layout.fillHeight: true
                Layout.preferredWidth: 35

                Rectangle {
                    anchors.centerIn: parent
                    id: image
                    height: parent.width*0.65
                    width: height
                    radius: height/2
                    color: {
                        if (index>ViewManager.currentStepIndex) {
                            return systemPalette.mid;
                        }
                        return systemPalette.highlight
                    }
                    z: 10
                }
                Rectangle {
                    color: {
                        if (index>ViewManager.currentStepIndex && index!=1) {
                            return systemPalette.mid;
                        }
                        return systemPalette.highlight;

                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: image.verticalCenter
                    height: parent.height/2
                    width: 5
                    z: 0
                }
                Rectangle {
                    color: {
                        if (index<ViewManager.currentStepIndex || ViewManager.currentStepIndex==list.count-1) {
                            return systemPalette.highlight;
                        }
                        return systemPalette.mid;
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: image.verticalCenter
                    height: parent.height/2
                    width: 5
                    //visible: (index !== (list.count - 1))
                    z: 0
                }
                Shape {
                    visible: index == ViewManager.currentStepIndex
                    id: shape
                    anchors.fill: parent
                    smooth: true
                    layer.enabled: true
                    layer.samples: 8

                    ShapePath {
                        fillColor: "transparent"
                        strokeColor: systemPalette.highlight
                        strokeWidth: 3
                        capStyle: ShapePath.FlatCap

                        PathAngleArc {
                            centerX: shape.width/2; centerY: shape.height/2
                            radiusX: 15; radiusY: 15
                            startAngle: 0
                            sweepAngle: 360
                        }
                    }
                }
            }
        }
        header: RowLayout {
            height: 55
            anchors.right: parent.right
            anchors.left: parent.left
            Item {
                Layout.fillWidth: true
            }

            Shape {
                id: eiraShape
                Layout.preferredHeight: 27
                Layout.preferredWidth: 27

                ShapePath {
                    scale: Qt.size((eiraShape.width-1)/400, (eiraShape.height-1)/400)
                    fillColor: systemPalette.highlight
                    strokeWidth: -1
                    PathSvg {
                        path: "M190.9 101.1c-22.6 1.9-44.3 12.2-61 28.8-12.3 12.4-21.1 27.3-26.1 44.6-2 7-2.3 10.2-2.3 25.5 0 19.8 1.3 26.5 8.4 41.6 15.2 32.4 46.5 54.5 81.1 57.2 30.4 2.5 57.9-7.6 79.1-28.7 12.3-12.4 21.1-27.3 26.1-44.6 2-7 2.3-10.2 2.3-25.5s-.3-18.5-2.3-25.5c-2.9-9.9-8.6-22.3-14.2-30.6-5.6-8.2-17.7-20.3-25.9-25.9-13.4-9-30.9-15.5-44.6-16.6-3.8-.3-8.1-.6-9.5-.8-1.4-.1-6.4.1-11.1.5m43.9 84.5c18.4 33.9 33.2 61.8 32.9 62-.2.2-3-.1-6.3-.7-3.2-.6-10.4-.9-15.9-.6-12.2.6-25.1 4.6-36.8 11.3L201 262l-7.8-4.4c-11.6-6.8-24.6-10.7-36.7-11.3-5.5-.3-12.7 0-15.9.6-3.3.6-6.1.9-6.4.7-.5-.5 66-123.6 66.8-123.5.3 0 15.5 27.7 33.8 61.5"
                    }
                }
            }

            Label {
                text: "eiraos"
                font.pointSize: 16
                font.family: "Comfortaa"
                color: Branding.styleString(Branding.SidebarText)
                Layout.fillWidth: true
            }
            Item {
                Layout.fillHeight: true
                Layout.preferredWidth: 35

                Rectangle {
                    color: systemPalette.highlight
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    height: parent.height
                    width: 5
                    z: 0
                }
            }
        }
    }
    
    Item {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: list.height - list.contentHeight
        width: 35
        Rectangle {
            color: {
                if (ViewManager.currentStepIndex==list.count-1) {
                    return systemPalette.highlight;
                }
                return systemPalette.mid;
            }
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            height: parent.height
            width: 5
            z: 0
        }
    }
}
