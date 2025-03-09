# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "None")
  file(REMOVE_RECURSE
  "doxygen/html"
  )
endif()
