find_package(jansson 2.12 CONFIG QUIET)

if(jansson_FOUND)
  message(STATUS "Found jansson: ${jansson_INCLUDE_DIR} (found version ${jansson_VERSION})")
  add_library(jansson_external INTERFACE)  # dummy
else()
  include(ExternalProject)
  message(STATUS "Suitable jansson could not be located: downloading and building jansson instead.")
  ExternalProject_Add(jansson_external
    GIT_REPOSITORY https://github.com/akheron/jansson
    GIT_TAG v2.12
    UPDATE_COMMAND ""
    CMAKE_ARGS
      -DCMAKE_INSTALL_PREFIX=${STAGED_INSTALL_PREFIX}
      -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
      -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
      -DCMAKE_C_STANDARD=${CMAKE_C_STANDARD}
      -DJANSSON_COVERAGE=OFF
      -DJANSSON_EXAMPLES=OFF
      -DJANSSON_BUILD_DOCS=OFF
      -DJANSSON_BUILD_MAN=OFF
      -DJANSSON_WITHOUT_TESTS=ON
    LOG_DOWNLOAD 1
    LOG_UPDATE 1
    LOG_CONFIGURE 1
    LOG_BUILD 1
    LOG_INSTALL 1
    )
  set(jansson_DIR ${STAGED_INSTALL_PREFIX}/lib/cmake/jansson CACHE PATH "Path to internally built janssonConfig.cmake" FORCE)
endif()
