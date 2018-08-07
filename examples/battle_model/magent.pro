TEMPLATE = lib
QT -= core gui
CONFIG += c++11 object_parallel_to_source
TARGET_EXT = .pyd
DESTDIR = $$PWD/build
DEFINES += MAGENT_LIB
#DEFINES += EXPORT_PYTHON

SOURCES += \
    $$files(src/*.cc) \
    $$files(src/gridworld/*.cc) \
    $$files(src/discrete_snake/*.cc) \
    $$files(src/utility/*.cc)


# OpenMP
QMAKE_CFLAGS += -fopenmp
QMAKE_CXXFLAGS += -fopenmp
LIBS += -fopenmp

contains(DEFINES, EXPORT_PYTHON) {
    # Boost
    BOOST_ROOT = $$(BOOST_ROOT)
    isEmpty(BOOST_ROOT) {
        BOOST_ROOT = $$PWD/3rdparty/boost
    }
    INCLUDEPATH += $$BOOST_ROOT
    LIBS += -L$$BOOST_ROOT/lib64-msvc-14.1

    # Python
    PYTHON_ROOT = $$(PYTHON_ROOT)
    isEmpty(PYTHON_ROOT) {
        PYTHON_ROOT = $$PWD/3rdparty/python
    }
    INCLUDEPATH += $$PYTHON_ROOT/include
    LIBS += -L$$PYTHON_ROOT/libs
}
