cmake_minimum_required(VERSION 3.16)
project(cpp-template LANGUAGES C CXX)

set(CMAKE_VERBOSE_MAKEFILE OFF) # turn on to debug Makefile builds

# template: change to your project name, will be used for #define prefixes
#  example: CPPTEMPLATE will be used for CPPTEMPLATE_DEBUG=X, CPPTEMPLATE_FOO=BAR, ...
# FIXME: (in your project), find and replace all instances of 'CPPTEMPLATE' to your desired prefix
set(PROJECT_PREFIX CPPTEMPLATE)

if (NOT "${CMAKE_CXX_STANDARD}")
    set(CMAKE_CXX_STANDARD 20)
endif ()

if (NOT CMAKE_BUILD_TYPE OR "${CMAKE_BUILD_TYPE}" STREQUAL "")
    set(CMAKE_BUILD_TYPE Release)

    message(WARNING "CMAKE_BUILD_TYPE undefined. Defaulting to Release.")
endif ()

include(cmake/options.cmake)  # *needs to be first*
include(cmake/warnings.cmake)
include(cmake/flags.cmake)

if (${CMAKE_BUILD_TYPE} MATCHES "Release" AND ${${PROJECT_PREFIX}_ENABLE_IPO})
    include(CheckIPOSupported)
    check_ipo_supported(RESULT IPO_Supported OUTPUT ErrorMessage)

    if (IPO_Supported)
        set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)
        message(STATUS "Interprocedural optimizations enabled")
    endif ()
endif ()

add_subdirectory(lib/cpp-utils/utils)
add_subdirectory(app)

if (${PROJECT_PREFIX}_BUILD_TESTS)
    add_subdirectory(tests)
endif ()
