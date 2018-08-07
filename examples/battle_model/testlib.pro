TEMPLATE = app
QT -= core gui
CONFIG += c++11 object_parallel_to_source
DESTDIR = $$PWD/build

SOURCES += \
    $$files(src/*.cc) \
    $$files(src/gridworld/*.cc) \
    $$files(src/discrete_snake/*.cc) \
    $$files(src/utility/*.cc)


# OpenMP
QMAKE_CFLAGS += -fopenmp
QMAKE_CXXFLAGS += -fopenmp
LIBS += -fopenmp
