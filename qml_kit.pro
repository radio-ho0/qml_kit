TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    src/ejsonpath.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES += test/*.qml
OTHER_FILES += widget/*.qml
OTHER_FILES += main.qml

HEADERS += \
    src/ejsonpath.h \
    src/qtjsonpath/QtJsonPath.h

DISTFILES += \
    src/qtjsonpath/QtJsonPath.qbs \
    src/qtjsonpath/README.md
