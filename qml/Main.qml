import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.3

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'example-rgba.yourname'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent
        header: PageHeader {
            id: header
            title: i18n.tr('Rendering RGBA')
        }

        Image {
        id: image
        fillMode: Image.PreserveAspectFit
        anchors {
            top: header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

            Python {
                Component.onCompleted: {
                addImportPath(Qt.resolvedUrl('../src/'));
                importModule('example', function () {
                    image.source = 'image://python/image-id-passed-from-qml';
                });
                }

                onError: console.log('Python error: ' + traceback)
            }
        }
    }
}