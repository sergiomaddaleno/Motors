

# Conan automatically generated toolchain file
# DO NOT EDIT MANUALLY, it will be overwritten

# Avoid including toolchain file several times (bad if appending to variables like
#   CMAKE_CXX_FLAGS. See https://github.com/android/ndk/issues/323
include_guard()

message(STATUS "Using Conan toolchain: ${CMAKE_CURRENT_LIST_FILE}")

if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeToolchain' generator only works with CMake >= 3.15")
endif()






set(CMAKE_GENERATOR_PLATFORM "x64" CACHE STRING "" FORCE)






# Definition of VS runtime, defined from build_type, compiler.runtime, compiler.runtime_type
cmake_policy(GET CMP0091 POLICY_CMP0091)
if(NOT "${POLICY_CMP0091}" STREQUAL NEW)
    message(FATAL_ERROR "The CMake policy CMP0091 must be NEW, but is '${POLICY_CMP0091}'")
endif()
set(CMAKE_MSVC_RUNTIME_LIBRARY "$<$<CONFIG:Release>:MultiThreadedDLL>$<$<CONFIG:RelWithDebInfo>:MultiThreadedDLL>$<$<CONFIG:Debug>:MultiThreadedDebugDLL>")

string(APPEND CONAN_CXX_FLAGS " /MP12")
string(APPEND CONAN_C_FLAGS " /MP12")

# Extra c, cxx, linkflags and defines


if(DEFINED CONAN_CXX_FLAGS)
  string(APPEND CMAKE_CXX_FLAGS_INIT " ${CONAN_CXX_FLAGS}")
endif()
if(DEFINED CONAN_C_FLAGS)
  string(APPEND CMAKE_C_FLAGS_INIT " ${CONAN_C_FLAGS}")
endif()
if(DEFINED CONAN_SHARED_LINKER_FLAGS)
  string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT " ${CONAN_SHARED_LINKER_FLAGS}")
endif()
if(DEFINED CONAN_EXE_LINKER_FLAGS)
  string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT " ${CONAN_EXE_LINKER_FLAGS}")
endif()

get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(_CMAKE_IN_TRY_COMPILE)
    message(STATUS "Running toolchain IN_TRY_COMPILE")
    return()
endif()

set(CMAKE_FIND_PACKAGE_PREFER_CONFIG ON)

# Definition of CMAKE_MODULE_PATH
# The root (which is the default builddirs) path of dependencies in the host context
list(PREPEND CMAKE_MODULE_PATH "C:/Users/Usuario/.conan/data/glfw/3.3.8/_/_/package/87788707645a6a7a0bda278a5f55360eeefe8ff3/" "C:/Users/Usuario/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "C:/Users/Usuario/.conan/data/assimp/5.0.1/_/_/package/450a85d59ab55d81ba252e781acd4c73bff32111/" "C:/Users/Usuario/.conan/data/shaderc/2024.1/_/_/package/22f7fecd6902a48a81dae8e2ae73ddb3d20d4488/" "C:/Users/Usuario/.conan/data/glad/0.1.36/_/_/package/ddbd0650ac2f2d0259758fa39134856e7a5bd959/" "C:/Users/Usuario/.conan/data/stb/cci.20240531/_/_/package/9d3d9aac798392dbe5b8ddad56d332bc432631ac/" "C:/Users/Usuario/.conan/data/lua/5.4.7/_/_/package/164640aad040835ac89882393a96d89200694f04/" "C:/Users/Usuario/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "C:/Users/Usuario/.conan/data/glu/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "C:/Users/Usuario/.conan/data/minizip/1.2.13/_/_/package/ceba830b4ab3226cf201e29b11e7d3683bce38f2/" "C:/Users/Usuario/.conan/data/utfcpp/3.2.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "C:/Users/Usuario/.conan/data/irrxml/1.2/_/_/package/164640aad040835ac89882393a96d89200694f04/" "C:/Users/Usuario/.conan/data/kuba-zip/0.2.6/_/_/package/164640aad040835ac89882393a96d89200694f04/" "C:/Users/Usuario/.conan/data/poly2tri/cci.20130502/_/_/package/164640aad040835ac89882393a96d89200694f04/" "C:/Users/Usuario/.conan/data/rapidjson/cci.20220822/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "C:/Users/Usuario/.conan/data/zlib/1.3.1/_/_/package/164640aad040835ac89882393a96d89200694f04/" "C:/Users/Usuario/.conan/data/clipper/4.10.0/_/_/package/164640aad040835ac89882393a96d89200694f04/" "C:/Users/Usuario/.conan/data/spirv-headers/1.3.261.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "C:/Users/Usuario/.conan/data/bzip2/1.0.8/_/_/package/d74f69022acf854c1ce6f27efa07ccbb6504e4b1/")
# the generators folder (where conan generates files, like this toolchain)
list(PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

# Definition of CMAKE_PREFIX_PATH, CMAKE_XXXXX_PATH
# The Conan local "generators" folder, where this toolchain is saved.
list(PREPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR} )
list(PREPEND CMAKE_PROGRAM_PATH "C:/Users/Usuario/.conan/data/glfw/3.3.8/_/_/package/87788707645a6a7a0bda278a5f55360eeefe8ff3/bin" "C:/Users/Usuario/.conan/data/glew/2.2.0/_/_/package/187c86e330f71652b242085ff4304d46863f17ab/bin" "C:/Users/Usuario/.conan/data/assimp/5.0.1/_/_/package/450a85d59ab55d81ba252e781acd4c73bff32111/bin" "C:/Users/Usuario/.conan/data/shaderc/2024.1/_/_/package/22f7fecd6902a48a81dae8e2ae73ddb3d20d4488/bin" "C:/Users/Usuario/.conan/data/glad/0.1.36/_/_/package/ddbd0650ac2f2d0259758fa39134856e7a5bd959/bin" "C:/Users/Usuario/.conan/data/lua/5.4.7/_/_/package/164640aad040835ac89882393a96d89200694f04/bin" "C:/Users/Usuario/.conan/data/minizip/1.2.13/_/_/package/ceba830b4ab3226cf201e29b11e7d3683bce38f2/bin" "C:/Users/Usuario/.conan/data/irrxml/1.2/_/_/package/164640aad040835ac89882393a96d89200694f04/bin" "C:/Users/Usuario/.conan/data/kuba-zip/0.2.6/_/_/package/164640aad040835ac89882393a96d89200694f04/bin" "C:/Users/Usuario/.conan/data/poly2tri/cci.20130502/_/_/package/164640aad040835ac89882393a96d89200694f04/bin" "C:/Users/Usuario/.conan/data/zlib/1.3.1/_/_/package/164640aad040835ac89882393a96d89200694f04/bin" "C:/Users/Usuario/.conan/data/clipper/4.10.0/_/_/package/164640aad040835ac89882393a96d89200694f04/bin" "C:/.conan/770b3b/1/bin" "C:/.conan/d9f80c/1/bin" "C:/Users/Usuario/.conan/data/bzip2/1.0.8/_/_/package/d74f69022acf854c1ce6f27efa07ccbb6504e4b1/bin")
list(PREPEND CMAKE_LIBRARY_PATH "C:/Users/Usuario/.conan/data/glfw/3.3.8/_/_/package/87788707645a6a7a0bda278a5f55360eeefe8ff3/lib" "C:/Users/Usuario/.conan/data/glew/2.2.0/_/_/package/187c86e330f71652b242085ff4304d46863f17ab/lib" "C:/Users/Usuario/.conan/data/assimp/5.0.1/_/_/package/450a85d59ab55d81ba252e781acd4c73bff32111/lib" "C:/Users/Usuario/.conan/data/shaderc/2024.1/_/_/package/22f7fecd6902a48a81dae8e2ae73ddb3d20d4488/lib" "C:/Users/Usuario/.conan/data/glad/0.1.36/_/_/package/ddbd0650ac2f2d0259758fa39134856e7a5bd959/lib" "C:/Users/Usuario/.conan/data/lua/5.4.7/_/_/package/164640aad040835ac89882393a96d89200694f04/lib" "C:/Users/Usuario/.conan/data/minizip/1.2.13/_/_/package/ceba830b4ab3226cf201e29b11e7d3683bce38f2/lib" "C:/Users/Usuario/.conan/data/irrxml/1.2/_/_/package/164640aad040835ac89882393a96d89200694f04/lib" "C:/Users/Usuario/.conan/data/kuba-zip/0.2.6/_/_/package/164640aad040835ac89882393a96d89200694f04/lib" "C:/Users/Usuario/.conan/data/poly2tri/cci.20130502/_/_/package/164640aad040835ac89882393a96d89200694f04/lib" "C:/Users/Usuario/.conan/data/zlib/1.3.1/_/_/package/164640aad040835ac89882393a96d89200694f04/lib" "C:/Users/Usuario/.conan/data/clipper/4.10.0/_/_/package/164640aad040835ac89882393a96d89200694f04/lib" "C:/.conan/770b3b/1/lib" "C:/.conan/d9f80c/1/lib" "C:/Users/Usuario/.conan/data/bzip2/1.0.8/_/_/package/d74f69022acf854c1ce6f27efa07ccbb6504e4b1/lib")
list(PREPEND CMAKE_INCLUDE_PATH "C:/Users/Usuario/.conan/data/glfw/3.3.8/_/_/package/87788707645a6a7a0bda278a5f55360eeefe8ff3/include" "C:/Users/Usuario/.conan/data/glew/2.2.0/_/_/package/187c86e330f71652b242085ff4304d46863f17ab/include" "C:/Users/Usuario/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "C:/Users/Usuario/.conan/data/assimp/5.0.1/_/_/package/450a85d59ab55d81ba252e781acd4c73bff32111/include" "C:/Users/Usuario/.conan/data/shaderc/2024.1/_/_/package/22f7fecd6902a48a81dae8e2ae73ddb3d20d4488/include" "C:/Users/Usuario/.conan/data/glad/0.1.36/_/_/package/ddbd0650ac2f2d0259758fa39134856e7a5bd959/include" "C:/Users/Usuario/.conan/data/stb/cci.20240531/_/_/package/9d3d9aac798392dbe5b8ddad56d332bc432631ac/include" "C:/Users/Usuario/.conan/data/lua/5.4.7/_/_/package/164640aad040835ac89882393a96d89200694f04/include" "C:/Users/Usuario/.conan/data/minizip/1.2.13/_/_/package/ceba830b4ab3226cf201e29b11e7d3683bce38f2/include" "C:/Users/Usuario/.conan/data/minizip/1.2.13/_/_/package/ceba830b4ab3226cf201e29b11e7d3683bce38f2/include/minizip" "C:/Users/Usuario/.conan/data/utfcpp/3.2.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "C:/Users/Usuario/.conan/data/utfcpp/3.2.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include/utf8cpp" "C:/Users/Usuario/.conan/data/irrxml/1.2/_/_/package/164640aad040835ac89882393a96d89200694f04/include" "C:/Users/Usuario/.conan/data/kuba-zip/0.2.6/_/_/package/164640aad040835ac89882393a96d89200694f04/include" "C:/Users/Usuario/.conan/data/poly2tri/cci.20130502/_/_/package/164640aad040835ac89882393a96d89200694f04/include" "C:/Users/Usuario/.conan/data/rapidjson/cci.20220822/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "C:/Users/Usuario/.conan/data/zlib/1.3.1/_/_/package/164640aad040835ac89882393a96d89200694f04/include" "C:/Users/Usuario/.conan/data/clipper/4.10.0/_/_/package/164640aad040835ac89882393a96d89200694f04/include" "C:/.conan/770b3b/1/include" "C:/.conan/d9f80c/1/include" "C:/Users/Usuario/.conan/data/spirv-headers/1.3.261.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "C:/Users/Usuario/.conan/data/bzip2/1.0.8/_/_/package/d74f69022acf854c1ce6f27efa07ccbb6504e4b1/include")



if (DEFINED ENV{PKG_CONFIG_PATH})
set(ENV{PKG_CONFIG_PATH} "C:/Users/Usuario/Desktop/3PVG_PMG_micopli_pabolt/src/build/build/generators;$ENV{PKG_CONFIG_PATH}")
else()
set(ENV{PKG_CONFIG_PATH} "C:/Users/Usuario/Desktop/3PVG_PMG_micopli_pabolt/src/build/build/generators;")
endif()




# Variables
# Variables  per configuration


# Preprocessor definitions
# Preprocessor definitions per configuration
