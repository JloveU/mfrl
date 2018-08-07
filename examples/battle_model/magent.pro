TEMPLATE = lib
QT -= core gui
CONFIG += c++11 object_parallel_to_source
TARGET_EXT = .pyd
DESTDIR = $$PWD/build
DEFINES += MAGENT_LIB

SOURCES += \
    $$files(src/*.cc) \
    $$files(src/gridworld/*.cc) \
    $$files(src/discrete_snake/*.cc) \
    $$files(src/utility/*.cc)


# OpenMP
QMAKE_CFLAGS += -fopenmp
QMAKE_CXXFLAGS += -fopenmp
LIBS += -fopenmp
