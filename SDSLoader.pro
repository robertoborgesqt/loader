QT -= gui
QT += androidextras
CONFIG += c++11 console
CONFIG -= app_bundle


DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        main.cpp \
    packagemanager.cpp \
    application.cpp

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../Qt5.9/5.11.0/android_armv7/lib/release/ -lQt5ServiceSupport
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../Qt5.9/5.11.0/android_armv7/lib/debug/ -lQt5ServiceSupport
else:unix: LIBS += -L$$PWD/../../../../Qt5.9/5.11.0/android_armv7/lib/ -lQt5ServiceSupport

INCLUDEPATH += $$PWD/../../../../Qt5.9/5.11.0/Src/qtandroidextras/include/QtAndroidExtras
DEPENDPATH += $$PWD/../../../../Qt5.9/5.11.0/Src/qtandroidextras/include/QtAndroidExtras

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../../Qt5.9/5.11.0/android_armv7/lib/release/libQt5ServiceSupport.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../../Qt5.9/5.11.0/android_armv7/lib/debug/libQt5ServiceSupport.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../../Qt5.9/5.11.0/android_armv7/lib/release/Qt5ServiceSupport.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../../Qt5.9/5.11.0/android_armv7/lib/debug/Qt5ServiceSupport.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../../../Qt5.9/5.11.0/android_armv7/lib/libQt5ServiceSupport.a

HEADERS += \
    packagemanager.h \
    application.h
