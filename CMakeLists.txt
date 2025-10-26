cmake_minimum_required(VERSION 3.16)

project(schematic_builder VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appschematic_builder
    main.cpp
)

qt_add_qml_module(appschematic_builder
    URI schematic_builder
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES CustomRect.qml
        QML_FILES GridBackground.qml
        SOURCES diagramdocument.h diagramdocument.cpp
        SOURCES shapeitem.h
        SOURCES shapemodel.h shapemodel.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appschematic_builder PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appschematic_builder
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appschematic_builder
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appschematic_builder
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
