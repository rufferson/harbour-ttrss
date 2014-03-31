# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-ttrss

CONFIG += sailfishapp

SOURCES += src/TTRSS.cpp

OTHER_FILES += \
    qml/cover/CoverPage.qml \
    rpm/harbour-ttrss.spec \
    rpm/harbour-ttrss.yaml \
    qml/pages/MainPage.qml \
    qml/pages/Settings.qml \
    qml/pages/Alert.qml \
    qml/pages/Category.qml \
    qml/pages/Headline.qml \
    qml/pages/Article.qml \
    harbour-ttrss.desktop \
    qml/harbour-ttrss.qml

