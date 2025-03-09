# Install script for directory: /media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/aarch64-linux-gnu-objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/b-arm/ggml/src/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/b-arm/ggml/src/libggml.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-cpu.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-alloc.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-backend.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-blas.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-cann.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-cuda.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-kompute.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-opt.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-metal.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-rpc.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-sycl.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/ggml-vulkan.h"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/ggml/include/gguf.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/b-arm/ggml/src/libggml-base.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ggml" TYPE FILE FILES
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/b-arm/ggml/ggml-config.cmake"
    "/media/ll/Ventoy/llama_cpp/main/llama.cpp-master/b-arm/ggml/ggml-version.cmake"
    )
endif()

