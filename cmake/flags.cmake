if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
    # template: enable if using std::execution with gcc or clang
    #    link_libraries(tbb)
endif ()

if (MSVC)
    add_link_options(/ignore:4099)
    #    link_libraries(legacy_stdio_definitions)
endif ()

if (${CMAKE_BUILD_TYPE} MATCHES "Debug")
    add_compile_definitions(${PROJECT_PREFIX}_DEBUG=1)
    add_compile_definitions(${PROJECT_PREFIX}_RELEASE=0)
else ()
    add_compile_definitions(${PROJECT_PREFIX}_DEBUG=0)
    add_compile_definitions(${PROJECT_PREFIX}_RELEASE=1)
endif ()

if (${${PROJECT_PREFIX}_WITH_SCOPED_PROFILER})
    add_compile_definitions(${PROJECT_PREFIX}_WITH_SCOPED_PROFILER=1)
else ()
    add_compile_definitions(${PROJECT_PREFIX}_WITH_SCOPED_PROFILER=0)
endif ()
