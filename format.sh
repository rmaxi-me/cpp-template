#!/usr/bin/env sh

find lib cli -name "*.cpp" -or -name "*.hpp" | xargs clang-format -i --verbose
