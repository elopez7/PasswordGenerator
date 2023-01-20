cmake_minimum_required(VERSION 3.16)

project(PasswordGenerator VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appPasswordGenerator
    main.cpp
    passwordgeneratorobject.h passwordgeneratorobject.cpp qrc.qrc
)

qt_add_qml_module(appPasswordGenerator
    URI PasswordGenerator
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(appPasswordGenerator PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appPasswordGenerator
    PRIVATE Qt6::Quick)

install(TARGETS appPasswordGenerator
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
