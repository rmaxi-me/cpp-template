cmake_minimum_required(VERSION 3.16)
project(cpp-template LANGUAGES C CXX)

set(CMAKE_VERBOSE_MAKEFILE OFF) # turn on to debug Makefile builds

# template: change to your project name, will be used for #define prefixes
#  example: CPPTEMPLATE will be used for CPPTEMPLATE_DEBUG=X, CPPTEMPLATE_FOO=BAR, ...
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

add_subdirectory(lib)
add_subdirectory(cli)