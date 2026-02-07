cmake_minimum_required(VERSION 3.16)

project(dashboard_2 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)


qt_add_resources(RESOURCE_FILES
    assets.qrc
)


qt_add_executable(appdashboard_2
    main.cpp
    ${RESOURCE_FILES}
)



qt_add_qml_module(appdashboard_2
    URI dashboard_2
    QML_FILES
        Main.qml
    RESOURCES
        assets.qrc
        QML_FILES SingleRow.qml
        QML_FILES CustomPrg.qml
)



set_target_properties(appdashboard_2 PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appdashboard_2
    PRIVATE Qt6::Quick
)
