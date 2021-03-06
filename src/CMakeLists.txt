SET(CMake_CXX_COMPILER clang++)
#SET(CMake_CXX_COMPILER g++)
SET(SERVER_EXECUTABLE "Server")
SET(CLIENT_EXECUTABLE "Client")

SET(CMAKE_CXX_BASIC_FLAGS
  "$ENV{CXXFLAGS} -Wall -Werror -cast-align -sign-compare missing-prototypes -Packed -Padded -unreachable-code -Inline disable-optimization
  -Wextra -Wconversion -Wno-unused-parameter -Wold-style-cast -Woverloaded-virtual -Wpointer-arith -Wshadow -Weffc++ -Wswitch-default "
  )
SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_BASIC_FLAGS} -ggdb")
SET(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_BASIC_FLAGS} -O2")


INCLUDE_DIRECTORIES(
  ${PROJECT_SOURCE_DIR}/include
)

SET(SLICE_SRC_LIST
  Printer.cpp
)

SET(SERVER_SRC_LIST
  ${SLICE_SRC_LIST}
  Server.cpp
)

SET(CLIENT_SRC_LIST
  ${SLICE_SRC_LIST}
  Client.cpp
)

ADD_EXECUTABLE(
  ${SERVER_EXECUTABLE} ${SERVER_SRC_LIST}
)

ADD_EXECUTABLE(
  ${CLIENT_EXECUTABLE} ${CLIENT_SRC_LIST}
)

SET(LINK_LIBRARIES
  Ice
  IceUtil
  pthread
  #jemalloc
  )


TARGET_LINK_LIBRARIES(${SERVER_EXECUTABLE} ${LINK_LIBRARIES})
TARGET_LINK_LIBRARIES(${CLIENT_EXECUTABLE} ${LINK_LIBRARIES})


INSTALL(TARGETS ${SERVER_EXECUTABLE} ${CLIENT_EXECUTABLE}
  RUNTIME DESTINATION bin)
