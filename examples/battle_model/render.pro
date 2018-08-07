TEMPLATE = app
QT -= core gui
CONFIG += c++11
DESTDIR = $$PWD/build/render

SOURCES += \
    $$files(src/render/*.cc) \
    $$files(src/render/backend/*.cc) \
    $$files(src/render/backend/utility/*.cc)


# OpenMP
QMAKE_CFLAGS += -fopenmp
QMAKE_CXXFLAGS += -fopenmp
LIBS += -fopenmp

# JsonCpp
JSONCPP_ROOT = $$(JSONCPP_ROOT)
isEmpty(JSONCPP_ROOT) {
    JSONCPP_ROOT = $$PWD/3rdparty/jsoncpp
}
INCLUDEPATH += $$JSONCPP_ROOT/include
SOURCES += $$JSONCPP_ROOT/src/jsoncpp.cpp

# WebSocket++
WEBSOCKETPP_ROOT = $$(WEBSOCKETPP_ROOT)
isEmpty(WEBSOCKETPP_ROOT) {
    WEBSOCKETPP_ROOT = $$PWD/3rdparty/websocketpp
}
INCLUDEPATH += $$WEBSOCKETPP_ROOT/include

# Boost
BOOST_ROOT = $$(BOOST_ROOT)
isEmpty(BOOST_ROOT) {
    BOOST_ROOT = $$PWD/3rdparty/boost
}
INCLUDEPATH += $$BOOST_ROOT/include
LIBS += -L$$BOOST_ROOT/lib
!win32: LIBS += -lboost_system


# install
install_frontend.path = $$DESTDIR
install_frontend.files = $$PWD/src/render/frontend/*
install_backend_demo.path = $$DESTDIR
install_backend_demo.files = $$PWD/src/render/backend/demo/*
INSTALLS += install_frontend install_backend_demo
