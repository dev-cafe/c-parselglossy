cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(c-parselglossy_core LANGUAGES C)

find_package(jansson CONFIG REQUIRED)
get_target_property(
  _loc
  jansson::jansson
  INTERFACE_INCLUDE_DIRECTORIES
  )
message(STATUS "Found jansson: ${_loc} (found version ${jansson_VERSION})")

add_executable(example example.c)

target_link_libraries(example
  PRIVATE
    jansson::jansson
  )
