if (UNIX AND NOT APPLE)
    # template: enable if using std::execution with gcc
    #    link_libraries(tbb)
    #    add_compile_definitions(TBB_SUPPRESS_DEPRECATED_MESSAGES=1) # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101228
endif ()

if (MSVC)
    add_link_options(/ignore:4099)
    #    link_libraries(legacy_stdio_definitions)
endif ()

# TODO: proper std::execution availability check
if (CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
    add_compile_definitions(${PROJECT_PREFIX}_HAS_EXEC_POLICIES=0)
else ()
    add_compile_definitions(${PROJECT_PREFIX}_HAS_EXEC_POLICIES=1)
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
