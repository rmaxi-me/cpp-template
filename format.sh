#!/usr/bin/env sh

find app -name "*.cpp" -or -name "*.hpp" | xargs clang-format -i --verbose
